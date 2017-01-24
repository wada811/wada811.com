+++
date = "2015-03-03T08:51:30+09:00"
draft = false
title = "git commit --amend でコミットメッセージを編集しない方法"
tags = [
    "Git",
]

+++

`git commit --amend` すると `vim` などでコミットメッセージの編集画面が開きます。
コミットメッセージは別に修正したくない場合や、
シェルスクリプトで `git commit --amend` を使いたい場合は
いちいちコミットメッセージの編集画面になるのが面倒です。
何か方法はないかと探してみると以下のオプションがありました。

```
-C, --reuse-message <commit>	reuse message from specified commit
```

## コマンド

```
git commit --amend -C @
```
