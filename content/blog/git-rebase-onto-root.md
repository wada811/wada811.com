---
title: "git rebase --onto で初回のコミットの前にコミットを追加する"
date: "2017-01-23T08:51:35+09:00"
draft: false
tags: [
    "Git"
]

---

## コマンド

`git rebase --onto <newbase> --root <branch>`

## ユースケース

1. ローカルでファイルをコミット(`master`)
1. GitHub でリポジトリ作成
1. GitHub 上で README.md, LICENSE.md をコミット(`origin/master`)
1. `git rebase --onto origin/master --root master` を実行
1. README.md, LICENSE.md のコミットの上にローカルのファイルのコミットが積み上がります。

## 例

![git rebase --onto github --root local](/images/git-rebase-onto-root/git-rebase-onto-root-history.png)

説明用にブランチ名を<br>
ローカルのファイルをコミットしたブランチを `local`,<br>
GitHub 上でファイルをコミットしたブランチを `github` とします。<br>
`git rebase --onto origin/github --root local` を実行したブランチは `master` です。<br>
`local` のコミットが cherry-pick されたように `github` ブランチに積み上がります。

## References

- [git rebase \-\-onto どこへ どこから どのブランチを \- Qiita](http://qiita.com/sotarok/items/07c6b2cca5ed2f9a53a6)
- [Git rebase \-\-onto \-\-root で過去の歴史を改変する \- なんとな～くしあわせ？の日記](http://nantonaku-shiawase.hatenablog.com/entry/2015/03/01/005658)
