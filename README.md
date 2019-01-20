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

## heroku
### master 以外のブランチデプロイ
https://qiita.com/wroc/items/d15b1015c899b0cf77da
git push heroku heroku-staging:master --force
