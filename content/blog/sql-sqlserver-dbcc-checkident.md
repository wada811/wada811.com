---
date: "2017-06-19T20:52:44+09:00"
draft: false
title: "[SQL Server][Transact-SQL] Indentity の値を調べる・設定する"
tags: [
	"SQL",
	"Transact-SQL",
	"SQL Server"
]

---

## Indentity の値を調べる
Users テーブルの Indentity の値を調べる場合は以下のSQLを実行する。
```sql
DBCC CHECKIDENT (Users, NORESEED);
```

> ID 情報を調べています。現在の ID 値 '42'、現在の列値 'NULL'。

> DBCC の実行が完了しました。DBCC がエラー メッセージを出力した場合は、システム管理者に相談してください。

## Indentity の値を設定する
Users テーブルの Indentity の値をリセットして 1 から採番されるようにするには以下のSQLを実行する。
```sql
DBCC CHECKIDENT (Users, RESEED, 0);
```

> ID 情報を調べています。現在の ID 値 '0'、現在の列値 'NULL'。

> DBCC の実行が完了しました。DBCC がエラー メッセージを出力した場合は、システム管理者に相談してください。

## Reference
[DBCC CHECKIDENT \(Transact\-SQL\) \| Microsoft Docs](https://docs.microsoft.com/en-us/sql/t-sql/database-console-commands/dbcc-checkident-transact-sql)
