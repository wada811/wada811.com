---
date: "2015-08-31T08:57:15+09:00"
draft: false
title: "Pattern of symbolic link"
tags: [
    "Linux",
    "Linux Command",
]

---

## シンボリックリンクの作成

### ファイルのシンボリックリンクを作成する
```
ln -s ./path/to/source/file ./path/to/target/file
```

### ディレクトリのシンボリックリンクを作成する
```
ln -s ./path/to/source/directory/ ./path/to/target/directory
```

注意点

- 元ディレクトリの末尾のスラッシュがないとエラーになる
- リンク先ディレクトリの末尾のスラッシュがあるとエラーになる
- 既にリンク先に同名のディレクトリが存在する場合は上手く作成できない


## シンボリックリンクの削除

```
unlink ./path/to/target/file
```

こちらはファイルもディレクトリも同じ。