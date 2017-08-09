+++
date = "2017-08-01T14:17:05+09:00"
draft = false
title = "[SQL Server] Dump Schema and Data in SQL Server"
tags = [
    "SQL Server"
]

+++

## How

1. SQL Server Management Studio を開く
2. データベースサーバに接続する
3. ダンプしたいデータベースで右クリック
4. タスク > スクリプトの生成
5. 対象のオブジェクトの選択
6. スクリプト作成の詳細オプションを設定
    1. 「スクリプトを作成するデータの種類」の「スキーマとデータ」を選択
    2. 「DROP および CREATE のスクリプトを作成」の「DROP および CREATE のスクリプトを作成」を選択
7. 出力先情報を設定
8. スクリプトの出力

## References

- [SQL Server 2012 でダンプ – 64 Blog](http://blogs.gine2.jp/kusa/archives/2183)