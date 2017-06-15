+++
date = "2017-06-15T19:54:00+09:00"
draft = false
title = "[C#] System.currentTimeMillis() in C#"
tags = [
    "CSharp",
]

+++

ちょっと処理時間を計測したくなったので<br>
楽にミリ秒単位で現在時刻を取得する Java のアレを C# で。

```csharp
var unixTimestamp = (DateTime.UtcNow - new DateTime(1970, 1, 1)).TotalMilliseconds; // milliseconds since the Unix epoch
var ticks = new TimeSpan(DateTime.UtcNow.Ticks).TotalMilliseconds; // 処理時間の計測だったらこっちでも良い
```
