---
date: "2017-06-15T19:54:00+09:00"
draft: false
title: "[C#][ASP.NET MVC] Razor で改行コードを br タグに変換する"
tags: [
    "CSharp",
    "ASP.NET MVC",
]

---

PHP のいわゆる nl2br が欲しい場合、以下のように記述する。

```csharp
@Html.Raw(string.Join($"<br />{Environment.NewLine}", Html.Encode(rawText).Split(new string[] { "\r\n", "\r", "\n" }, StringSplitOptions.None)))
```

改行コードの前に br タグを挿入する、という動作なのに<br>
nl2br という名前なのはおかしいと思うが使い慣れてて馴染んでしまった。

## Reference
[PHP: nl2br \- Manual](http://php.net/manual/ja/function.nl2br.php)
