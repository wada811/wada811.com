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

## 処理時間の計測が行いたい場合

`Stopwatch` クラスを使うと良い。

```csharp
var stopwatch = new System.Diagnostics.Stopwatch();
stopwatch.Start();
Thread.Sleep(3 * 1000);
stopwatch.Stop();
TimeSpan elapsed = stopwatch.Elapsed;
long elapsedMilliseconds = stopwatch.ElapsedMilliseconds;
```

## Reference
[Stopwatch クラス \(System\.Diagnostics\)](https://msdn.microsoft.com/ja-jp/library/system.diagnostics.stopwatch(v=vs.110).aspx)
