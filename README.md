## lint
### haml-lint
```
$ bundle exec haml-lint
```

### rubocop

#### 構文チェック
```
$ bundle exec rubocop
```

#### 構文チェック & 自動整形
```
$ bundle exec rubocop -a
```

### webpack
bin/webpack-dev-server

#### 本番
RAILS_ENV=production bundle exec bin/webpack
## heroku
### master 以外のブランチデプロイ
https://qiita.com/wroc/items/d15b1015c899b0cf77da
git push heroku ishigaki:master --force

### log
$ heroku logs -t

### eslint

#### 構文チェック
```
$ bundle exec yarn run eslint 対象ファイルのパス
```

#### 構文チェック & 自動整形
```
$ bundle exec yarn run eslint --fix 対象ファイルのパス
```

/usr/local/bin/bundle exec rails s -e production

```
$ export DENTIST_PRODUCTION_SERVER=133.167.124.33
$ scp config/master.key ishigaki-d:/var/www/dentist/shared/config/
$ bundle exec cap production deploy
```

# MetaMovics ver2.3 ASP構築メモ

## さくらのVPS

[さくらのVPSコントロールパネル](https://secure.sakura.ad.jp/vps/#/login)にログインし新規VPSを契約します。スペックなどは相談して決めてください。石狩ゾーンでOKです。

- メモリ 4GB以上
- ストレージ SSD 200GB以上
- OS CentOS7 x86_64
- 初期パスワードは適当に決めて控えておく

### 初期設定

[チュートリアル: CentOSサーバ作成直後に設定しておくべき初期セキュリティ設定](https://vps-news.sakura.ad.jp/tutorials/centos7-initial-settings/) に従って下記の設定を済ませてください。はじめはrootユーザと初期パスワードでSSHできます。

- 一般ユーザの作成
- 公開鍵認証の設定
- 一般ユーザでsudoできるようwheelグループに入れる
- rootユーザーのSSHログインを禁止する
- パスワード認証でのSSHを禁止する

（よく分からなくなったらOSを再インストールしてやり直そう）

### パケットフィルタに気をつける

さくらのVPSには[パケットフィルタ機能](https://vps.sakura.ad.jp/feature/packetfilter.html)があり、はじめは22番ポート(SSH)しか通信できないようになっています。VPSコントロールパネルから80/443番ポート(WEB)の通信を許可してください。SSHとWEB以外のポートは不要なので許可しないでください。

### 確認
centos7か？
```
cat /etc/redhat-release
```

## ミドルウェアのインストール

Ruby、MySQL、nginxをそれぞれインストールしていく。
最初にyumをupdateする。

```
$ sudo yum -y update  # ちょっと時間かかる
```

好きな仮想端末をインストールする
```
$ sudo yum -y install tmux
```

あとで必要になるものをインストールする
```
$ sudo yum -y install openssl-devel readline-devel libxml2-devel libxslt-devel git gcc gcc-c++
```

### Rubyのインストール
基本的には rbenv を利用してインストールして下さい。

rbenvを使わずにソースコードからRubyをビルドするには下記のようにしてください。安定版`2.6.5`が必要です。

```
$ curl https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.5.tar.gz -o ruby-2.6.5.tar.gz
$ tar -xvf ruby-2.6.5.tar.gz
$ cd ruby-2.6.5/
$ ./configure
$ make
$ sudo make install
```

インストールできたか確認
```
$ ruby -v
```

bundlerのインストール
```
$ sudo /usr/local/bin/gem install bundler
```

### Node.jsのインストール

```
$ sudo yum -y install nodejs
```

### yarnのインストール

[公式](https://yarnpkg.com/lang/en/docs/install/#centos-stable)の通りにインストールする。

リポジトリの追加
```
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
```

インストール
```
$ sudo yum install yarn
```

確認
```
$ yarn --version
```

### MySQLのインストール

MySQL`8.0`をインストールします。（CentOS7にはmariadbという互換ソフトが先に入っていますがMySQLをインストールする際に自動で消えます。）

[MySQL公式のyumリポジトリ](https://dev.mysql.com/downloads/repo/yum/)を追加してインストールする
```
$ sudo rpm -ivh https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm

$ sudo yum -y update

$ sudo yum -y install mysql-community-server mysql-devel
```

インストールできたか確認
```
$ mysqld --version
```

起動する
```
$ sudo systemctl start mysqld.service
```

自動起動を有効にする
```
$ sudo systemctl enable mysqld.service
```

初回起動時にrootのtemporaryパスワードが自動生成されるので、ログファイルから生成されたパスワードを確認して控えておく
```
$ sudo cat /var/log/mysqld.log | grep password
```

対話形式でセキュリティ設定をする
```
$ mysql_secure_installation
```

- 新しいrootのパスワード`P@ssw0rd` ← そこそこ複雑にする
- Remove anonymous users?    → yes
- Disallow root login remotely?   → yes
- Remove test database and access to it? → yes
- Reload privilege tables now? → yes

※MySQL8.0では文字コードはデフォルトでutf8mb4になり、パスワードのlife_timeも無限になっているので特別に`/etc/my.cnf`を変更する必要はありません。

### nginxのインストール

nginx(エンジンエックス)はWebサーバです。
[公式の手順](http://nginx.org/en/linux_packages.html#instructions)に沿ってインストールします。

yumリポジトリを追加するために下記のファイルを新規作成する

```sh
$ sudo vim /etc/yum.repos.d/nginx.repo
```

下記を記述して保存する

```
[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true

[nginx-mainline]
name=nginx mainline repo
baseurl=http://nginx.org/packages/mainline/centos/$releasever/$basearch/
gpgcheck=1
enabled=0
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true
```

インストール
```
$ sudo yum install nginx
```

バージョンを確認します。(1.16.1以上のはず)

```sh
$ nginx -v
```

起動する
```
$ sudo systemctl start nginx
```

自動起動を有効にする
```
$ sudo systemctl enable nginx
```

### certbotのインストール

[certbot](https://certbot.eff.org/)はLet's EncryptでHTTPSの設定をするためのツールです。
[公式の手順](https://certbot.eff.org/lets-encrypt/centosrhel7-nginx)に沿ってcertbotとnginx向けの構成ツールをインストールします。

※はじめに[EPEL](https://fedoraproject.org/wiki/EPEL/ja)リポジトリが無効な場合は有効にしてください。

certbotとnginx向けの構成ツールをインストールする

```sh
$ sudo yum install certbot python2-certbot-nginx
```

バージョンの確認

```sh
$ certbot --version
```


## ファイアーウォールの設定

http通信、https通信を許可する
```
$ sudo systemctl start firewalld　#サービスを起動するコマンド
$ sudo systemctl enable firewalld　#自動起動設定
$ sudo firewall-cmd --permanent --add-service=http
$ sudo firewall-cmd --permanent --add-service=https
$ sudo firewall-cmd --reload
```

現在の設定を確認
```
$ sudo firewall-cmd --list-all
```

手元のPCからnginxのwelcomeページが見れるか確認する。

## MetaMovicsのインストール

デプロイ時にcapistranoを使えるようにする。

### 本番データベースの作成

MySQLのコンソールに入る
```
$ mysql -u root -p
```

`metamovics`データベースを作成する

```
mysql> CREATE DATABASE metamovics;
```

`metamovics`ユーザを作成する、パスワードも決める
```
mysql> CREATE USER 'metamovics'@'localhost' IDENTIFIED BY 'P@ssw0rd';
```

作成したユーザーに作成したデータベースの操作権限を付与する
```
mysql> GRANT ALL PRIVILEGES ON metamovics.* TO 'metamovics'@'localhost';
```

権限の設定を反映する
```
mysql> FLUSH PRIVILEGES;
```

コンソール終了
```
mysql> quit;
```

### ユーザの作成

`deploy`ユーザを作成をする
```
$ sudo useradd deploy
```

deployユーザに切り替わって鍵ペアを作る
```
$ sudo su deploy
[deploy@host] $ cd ~
[deploy@host] $ ssh-keygen
```

公開鍵を控える
```
[deploy@host] $ cat .ssh/id_rsa.pub
```

GithubのDeploy Keysへ控えた公開鍵を登録する

自分のmacからsshできるようにする
```
[deploy@host]$ vim .ssh/authorized_keys
[deploy@host]$ chmod 600 .ssh/authorized_keys
```

deployユーザから自分に戻る
```
[deploy@host] $ exit
```

### ディレクトリの作成

`/var/www/metamovics`を作成する
```
$ sudo mkdir -p /var/www/metamovics
```

metamovicsディレクトリをdepoyユーザのものにする
```
$ cd /var/www
$ sudo chown deploy:deploy metamovics/
```
### PATHを通す
```
$ sudo su -
$ visudo
```
```
Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin
```
secure_path に /usr/local/bin/ を追加する

```
$ exit
```

### 一旦ソースコードをcloneしてデータベースをsetupする

capistranoでデータベースのセットアップをする方法が分からなかったので、下記の通り作業したが、この手順は正しくないと思うので、後で検討する。

ユーザをdeployユーザに変更して作業を行う
```
$ sudo su deploy
[deploy@host]$ cd /var/www/metamovics
[deploy@host]$ git clone git@github.com:rio-development/metamovics.git .
[deploy@host]$ git checkout master
[deploy@host]$ bundle install --path vendor/bundle
[deploy@host]$ vim config/database.yml
```

config/database.ymlを書き換える

```database.yml
production:
  adapter: mysql2
  encoding: utf8
  pool: 5
  database: metamovics
  username: metamovics
  password: P@ssw0rd
  host: localhost
```

```
[deploy@host]$ export RAILS_ENV=production
[deploy@host]$ bundle exec rails db:setup
```

### nginxの設定

設定ファイルを新規作成
```
$ sudo vim /etc/nginx/conf.d/metamovics.conf
```

```metamovics.conf
upstream metamovics {
    server unix:///var/www/metamovics/shared/tmp/sockets/puma.sock;
}

server {
    listen       80;
    server_name  ******.metamovics.jp;

    client_max_body_size 1024M;

    access_log /var/log/nginx/access.log  main;
    error_log /var/log/nginx/error.log;

    root   /var/www/metamovics/current/public;

    location / {
        proxy_pass http://metamovics;
        proxy_set_header Host $http_host;
        proxy_set_header Client-IP $remote_addr;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_redirect off;
    }

    location ~ ^/assets/ {
        root /var/www/metamovics/current/public;
    }
}
```

default設定を削除
```
$ sudo mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.origin
```

再起動
```
$ sudo systemctl restart nginx
```

## ログを見る

nginxのアクセスログ
```
$ sudo tail -f /var/log/nginx/access.log
```

nginxのエラーログ
```
$ sudo tail -f /var/log/nginx/error.log
```

Railsのログ
```
$ tail -f /var/www/metamovics/shared/log/production.log
```

## デプロイ

capistrano でデプロイを行う

```
$ export METAMOVICS_PRODUCTION_SERVER=サーバのアドレス
$ bundle exec cap production deploy
```

ロゴの指定がある場合 capistrano のデプロイ後手動でファイルアップロードを行う
``` ロゴ画像の転送コマンドサンプル.bash
$ scp logo.png deploy@example.com:/var/www/metamovics/shared/public/images/custom/logo.png
```


## Pumaについて
### 自動起動設定

Pumaを自動で起動させるために、deployユーザーのcronに下記を設定する。

```sh
$ crontab -l
@reboot cd /var/www/metamovics/current && /usr/local/bin/bundle exec puma -C /var/www/metamovics/shared/puma.rb --daemon
```

### 再起動

Pumaの再起動はcapコマンドで行える。

```
$ export METAMOVICS_PRODUCTION_SERVER=サーバのアドレス
$ bundle exec cap production puma:restart
```

## 本番のデータベースをリセットする

```
$ cd /var/www/metamovics/current
$ RAILS_ENV=production DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bin/rails db:reset
```

## バックアップの設定

wip

## ドメインの設定

サーバのIPアドレスに `*****.metamovics.jp`のドメインを設定する

metamovics.jpはさくらで管理しているので、下記の手順で行う

1. さくらインターネットの会員メニューにログイン
2. [契約情報] > [契約ドメインの確認] > [ドメインメニュー]
3. metamovics.jpの[ゾーン編集]
4. [変更]をクリック
5. ページの下のほうに「エントリの追加と変更」フォームがあるので入力する
6. 新規登録ボタンを押したら左にある[データ送信]を忘れずに押す
7. 以上で登録できたので浸透するまで待つ

## アップローダーのビルドと設置
※ WindowsPCで `/metamovics-uploader/windows/LibraUploader/build_all.bat` をダブルクリックするとメタムアップローダーのzipファイルが生成される

1. windowsPCを用意する
2. VisualStudio2008をインストール（西側の棚にCDがある）
3. gitをインストール（SourceTreeごと入れるのが楽）
4. [metamovics-uploaderのリポジトリ](https://github.com/rio-development/metamovics-uploader)をcloneする
5. masterブランチのc1a27a9になっていることを確認する（meidaiブランチはだめ）
6. あとはREADME読んでビルドする
7. 完成したzipをサーバに上げる
8. テストする。実際に管理画面からwindowsPCにアップローダをインストールして動画をアップロードできるか確認する
9. テストがOKならおしまい
10. アップローダーは、`/var/www/metamovics/current/public/files`

## precompileを再試行
https://qiita.com/gymnstcs/items/00ae23b7fdf0c69b57c5
### Precompileしたものを全て削除
```
bundle exec rake assets:clobber RAILS_ENV=production
```
### precompileする（新しいdigest が割り振られる）
```
bundle exec rake assets:precompile RAILS_ENV=production
```
Webサーバを再起動
```
$ export METAMOVICS_PRODUCTION_SERVER=サーバのアドレス
```

```
$ bundle exec cap production puma:restart
```

## SSL化
https://qiita.com/HeRo/items/f9eb8d8a08d4d5b63ee9

nginx を止めないと上手く取得出来ないので注意

参考
https://github.com/rio-development/metamovics-jsce/wiki/%E6%9C%AC%E7%95%AA%E3%82%B5%E3%82%A4%E3%83%88%E3%81%AE%E7%92%B0%E5%A2%83%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6

ssl化した場合の metamovics.conf
```
upstream metamovics {
    server unix:///var/www/metamovics/shared/tmp/sockets/puma.sock;
}

server {
    server_name ik1-425-44503.vs.sakura.ne.jp;

    listen 443 ssl;
    ssl_certificate     /etc/letsencrypt/live/ik1-425-44503.vs.sakura.ne.jp/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/ik1-425-44503.vs.sakura.ne.jp/privkey.pem;

    client_max_body_size 1024M;

    access_log /var/log/nginx/access.log  main;
    error_log /var/log/nginx/error.log;

    root   /var/www/metamovics/current/public;

    location / {
        proxy_pass http://metamovics;
        proxy_set_header Host $http_host;
        proxy_set_header Client-IP $remote_addr;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-FORWARDED_PROTO https;
        proxy_redirect off;
    }

    location ~ ^/assets/ {
        root /var/www/metamovics/current/public;
    }
}

server {
    if ($host = ik1-425-44503.vs.sakura.ne.jp) {
        return 301 https://$host$request_uri;
    }


    listen 80;
    listen [::]:80;
    server_name ik1-425-44503.vs.sakura.ne.jp;
    return 404;
}
```
