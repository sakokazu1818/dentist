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

```
$ bundle exec cap production puma:restart
```