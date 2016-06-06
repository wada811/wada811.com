+++
date = "2016-06-06T20:00:00+09:00"
draft = false
title = "git reset コマンドで取り消してしまったコミットを元に戻す"
tags = [
    "Git",
]

+++

コミットを取り消したいと思ったら `git reset` を使いますが、
慣れてきてカジュアルに使っていると間違えて消したくないコミットまで消してしまうことがあります。

大事なコミットを取り消すととてもツラい。
でも、 git ならそんな時でも大丈夫！

`git reflog` で取り消したい操作の `HEAD@{x}` を確認します。
以下のコマンドを実行すれば操作の取り消しを行うことが出来ます。
```
git reset --hard "HEAD@{x}"
```
直前の操作なら `HEAD@{1}` で取り消すことが出来ます。

### 参考
[git reset --hardした内容を取り消す (git reset --hard, reflog, HEAD@{x}, 取り消してしまったコミットを元に戻す) - いろいろ備忘録日記](http://devlights.hatenablog.com/entry/20121121/p1)