+++
date = "2017-08-01T14:17:05+09:00"
draft = false
title = "[SQL Server][Transact-SQL] Add Column after a specific column in SQL Server"
tags = [
    "SQL Server",
    "Transact-SQL"
]

+++

## Why

SQL Server では MySQL のように ALTER TABLE 文で AFTER 句を使ってカラムを追加する位置を指定できません。<br>
[SQL Server Management Studio](https://docs.microsoft.com/en-US/sql/ssms/sql-server-management-studio-ssms) で GUI からカラムの位置を指定する必要があります。

> [Add Columns to a Table \(Database Engine\) \| Microsoft Docs](https://docs.microsoft.com/en-US/sql/relational-databases/tables/add-columns-to-a-table-database-engine)
> **Limitations and Restrictions**
> Using the ALTER TABLE statement to add columns to a table automatically adds those columns to the end of the table. If you want the columns in a specific order in the table, use SQL Server Management Studio.

しかし、手作業による温もりあるオペレーションはミスの元なのでどうにかしたいです。

## How

```
-- 1. Users テーブルのデータをテンポラリテーブルに退避
SELECT * INTO #Temp FROM Users

-- 2. Users テーブルを削除
DROP TABLE Users

-- 3. Users テーブル に Email カラムを追加
CREATE TABLE Users(
	UserId int NOT NULL,
	Name nvarchar(20) NOT NULL,
	Email nvarchar(254) NULL,
	Address nvarchar(50) NOT NULL,
	CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED
	(
		[UserId] ASC
	)
)

-- 4. テンポラリテーブルから Users テーブル にデータを挿入
INSERT INTO Users
SELECT
	UserId,
	Name,
	NULL
	Address
FROM #Temp

-- 5. テンポラリテーブルを削除
DROP TABLE #Temp
```

## References

- [Add Columns to a Table \(Database Engine\) \| Microsoft Docs](https://docs.microsoft.com/en-US/sql/relational-databases/tables/add-columns-to-a-table-database-engine)
- [カラムを任意の位置に追加 \| ひよっこSEのコツコツ備忘録](http://hiyokko-se.com/sqlserver_addcolumn)