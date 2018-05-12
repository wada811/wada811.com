---
date: "2015-03-04T22:40:40+09:00"
draft: false
title: "Hugo Getting Started"
tags: [
    "Hugo",
    "Blog",
    "Mac OS X"
]

---

## [Hugo](http://gohugo.io/) とは

静的サイトジェネレータ。
ブログを生成して GitHub Pages でホスティングしている人が多い印象。

## Hugo のインストール
### Mac の場合
Homebrew でインストール
```
brew install hugo
```
### その他の場合
[Installing Hugo](http://gohugo.io/overview/quickstart) を読んで。

## [静的サイトの作成](http://gohugo.io/overview/quickstart/#step-2-have-hugo-create-a-site-for-you:09c84f91027bd18b03251c05a0da4abb)
```
hugo new blog
```

`blog` は何でも良い。好きな名前を付けて欲しい。

```
tree blog
├── archetypes/
├── config.toml
├── content/
├── layouts/
└── static/
```

上記のような構造が生成される。

```
cd blog
```

以降は作成されたディレクトリ内で作業を行う。

## [テーマのインストール](http://gohugo.io/overview/quickstart/#step-4-install-some-themes:09c84f91027bd18b03251c05a0da4abb)
```
git clone --recursive https://github.com/spf13/hugoThemes.git themes
```

まずはテーマをインストールして使いたいものがないか探す。
あんまり種類はないので全部確認できると思う。

### テーマの確認

以下のコマンドでテーマを選んでプレビューしよう。

```
hugo server -t "`ls themes | peco`"
```

peco をインストールしていない場合は themes 以下のディレクトリ名を指定。

