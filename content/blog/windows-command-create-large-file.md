---
date: "2017-04-25T12:54:00+09:00"
draft: false
title: "[Windows] 巨大なサイズのファイルを作成するコマンド"
tags: [
    "Windows",
    "Windows Command",
]

---

## Commnad

```
fsutil file createnew
```

> 使用法 : fsutil file createnew <ファイル名> <長さ>

> 例 : fsutil file createnew C:\testfile.txt 1000

### 100MiB のファイルを作成する
```
fsutil file createnew ./100MiB.txt $(1024*1024*100)
```

## Reference

[Tech TIPS：Windowsで巨大なサイズのファイルを簡単に作る方法 \- ＠IT](http://www.atmarkit.co.jp/ait/articles/0209/28/news002.html)
