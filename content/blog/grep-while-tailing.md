---
date: "2015-08-27T21:13:26+09:00"
draft: false
title: "tail しながら grep する"
tags: [
    "Linux",
    "Linux Command"
]

---

アクセスログを `tail -f` でリアルタイム監視しながら、
その結果を `grep` でフィルタリングしたいという事ありますよね。

そんな時は `grep` のオプションの `--line-buffered` をつければよいです。

```
tail -f access.log | grep --line-buffered "Status: 500"
```