+++
date = "2015-09-09T08:44:56+09:00"
draft = false
title = "Install Ruby on CentOS"
tags = [
    "Linux",
    "CentOS",
    "Ruby",
    "rbenv"
]

+++

バージョンによる違いはないと思う。<br>
実行したのは Amazon Linux だけど CentOS も同じかと。

## Git のインストール

```
sudo yum install -y git
```

もし入ってなかったら。

## rbenv のインストール

```
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
```

### ~/.bash_profile の編集

```
vim .bash_profile
```

`PATH=$PATH:$HOME/bin:$HOME/.rbenv/bin` に変更。

[sstephenson/rbenv](https://github.com/sstephenson/rbenv) だと先頭に追加しているけど問題なさそうなので末尾に追加した。

`eval "$(rbenv init -)"` も追加。

### ~/.bash_profile の変更の反映

```
source .bash_profile
```

### ruby-build のインストール

```
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
```

`rbenv install` が使えるようになる。

## Ruby のインストール

```
rbenv rehash
```

なんかやったら `rbenv rehash` が必要。

```
rbenv install -l
```

バージョンのリストアップ。

```
rbenv install 2.2.3
```

バージョンを指定してインストール。

```
sudo yum install -y gcc openssl-devel readline-devel zlib-devel
```

エラーになるので必要な物をインストール。<br>
成功するまで Ruby のインストールを繰り返す。

```
rbenv rehash
```

インストール成功したら `rbenv rehash`

```
rbenv versions
```

バージョン一覧を表示してインストール成功を確認。

## Ruby のバージョンを指定

```
rbenv global 2.2.3
```