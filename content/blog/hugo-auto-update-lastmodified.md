+++
date = "2017-03-15T17:54:00+09:00"
title = "Hugo の記事の更新日時に Git のコミット日時を設定する"
draft = false
tags = [
    "Hugo",
    "Blog"
]

+++

## Why
記事の更新日時を自動で設定したい。<br>
自分で更新したくないよね？<br>
Git のコミット日時が設定されたら最高だよね。

## How

1. [Hugo 0.18.0](https://gohugo.io/meta/release-notes/#0-18-0-december-19th-2016) 以上を使用する。
2. Hugo のビルド時に Git の情報を取得できるようにする。
3. テンプレートで `.GitInfo.AuthorDate` を参照する。

以上。

## Diff
[日付をGitのコミット日で表示する · wada811/wada811.com@12c8572](https://github.com/wada811/wada811.com/commit/12c857219904f842cbbfab5fe991cdf6afee41a5)

## Refernces

- [Displaying GIT metadata in Hugo templates](http://rac.su/post/hugo/gitinfo/)
- [https://raw\.githubusercontent\.com/rac2030/rac\.su/master/content/post/hugo/gitinfo\.md](https://raw.githubusercontent.com/rac2030/rac.su/master/content/post/hugo/gitinfo.md) (※上記記事の元ファイル)
