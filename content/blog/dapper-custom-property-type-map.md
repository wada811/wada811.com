---
date: "2017-06-19T19:54:00+09:00"
draft: false
title: "[C#][Dapper] カラム名と変数をマッピングする"
tags: [
    "CSharp",
    "Dapper",
]

---

[Dapper \- a simple object mapper for \.Net](https://github.com/StackExchange/Dapper) を利用する際に、<br>
標準ではカラム名と変数名が一致するとマッピングされます。<br>
しかし、必ずしも一致するわけではないのが現実です。<br>
変数名を一致させる、カラム名にエイリアスをつけて一致させる方式が思い浮かびますが、<br>
どちらも以下の理由からイマイチです。

- 変数名を一致させる。
	- DB 由来のイマイチな変数名になってしまう。
		- スネークケースとキャメルケースの違い
		- カラム名が日本語
		- そもそも命名が微妙
- カラム名にエイリアスをつけて変数名と一致させる。
	- SELECT 時に毎回エイリアスをつける必要がある。
		- 不要な繰り返し。宣言的に定義されるべき。

## クラスにカラム名を Attribute で定義する

この方式では以下のような効能があります。

- カラム名と変数名を分離し、お互いの命名規則から解放される。
- 宣言的に定義できることによって不要な繰り返しから解放される。

ASP.NET MVC なら `Application_Start` で以下のコードを呼び出しておけば効果を実感できるでしょう。

```csharp
Assembly.GetAssembly(typeof(IDataModel))
    .GetTypes()
    .Where(t => typeof(IDataModel).IsAssignableFrom(t) && typeof(IDataModel) != t)
    .ToList()
    .ForEach(dataModelType =>
    {
        Dapper.SqlMapper.SetTypeMap(
            dataModelType,
            new CustomPropertyTypeMap(
                dataModelType,
                (type, columnName) =>
                    type.GetProperties().FirstOrDefault(prop =>
                        prop.Name == columnName ||
                        prop.GetCustomAttributes(true)
                            .OfType<ColumnAttribute>()
                            .Any(attr => attr.Name == columnName)
                    )
            )
        );
    });
```

やっていることは以下のとおりです。

1. マーカーインタフェース `IDataModel` を定義
2. リフレクションで実装しているクラスを抽出
3. リフレクションでプロパテイの名前と、`ColumnAttribute`で設定した名前を取得
4. カラム名に一致する場合にマッピングするよう `CustomPropertyTypeMap` を設定

クラスには変数に`ColumnAttribute`でカラム名を設定するだけでマッピングできます。

```csharp
public class FileEntity : IDataModel
{
    [Column("ファイルID")]
    public int Id { get; set; }
    [Column("ファイル名")]
    public string Name { get; set; }
    [Column("ファイルサイズ")]
    public int Size { get; set; }
}
```

`ColumnAttribute` は自分で定義しても良いが、同様の用途なので<br>
Entity Framework の `System.ComponentModel.DataAnnotations.Schema.ColumnAttribute` を使用しました。

## おまけ: スネークケースとキャメルケースのマッピング

Attribute で定義しなくてもオプション一つで対応可能。

```
Dapper.DefaultTypeMap.MatchNamesWithUnderscores = true;
```
