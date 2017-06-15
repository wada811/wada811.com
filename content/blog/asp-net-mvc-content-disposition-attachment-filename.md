+++
date = "2017-06-15T19:54:00+09:00"
draft = false
title = "[C#][ASP.NET MVC] ファイルをダウンロードする際に日本語ファイル名が文字化けする"
tags = [
    "CSharp",
    "ASP.NET MVC",
    "Internet Explorer"
]

+++

以下のように `Content-Disposition` を設定して、 Chrome でダウンロードしてみると正常にダウンロードできますが、<br>
IE で開くとファイル名が文字化けしてしまいます。

```csharp
Response.AddHeader("Content-Disposition", $"attachment; filename={fileName}.xlsx");
```

調べると、`Content-Disposition`ヘッダーに非 ASCII 文字を含む場合、本来は`filename*`値にエンコードした値を指定する必要があるそうです。<br>
そのため、以下のように記述して文字化けを防ぎます。

```csharp
Response.AddHeader("Content-Disposition", $"attachment; filename*=UTF-8''{Server.UrlEncode($"{fileName}.xlsx")}");
```

## Refeerence
- [ファイルをダウンロードする ASP\.NET ページで日本語ファイル名が文字化けする](https://support.microsoft.com/ja-jp/help/436616)
- [Content\-Disposition \- HTTP \| MDN](https://developer.mozilla.org/ja/docs/Web/HTTP/Headers/Content-Disposition)
