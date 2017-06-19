+++
date = "2017-06-15T19:54:00+09:00"
draft = false
title = "[C#] switch 文でフォールスルー"
tags = [
    "CSharp",
]

+++

C# の `switch` 文は `break` を書かずに下の `case` が実行させるフォールスルーが禁止されています。<br>
以下のように `break` を書かないでフォールスルーさせようとするとコンパイルエラーで困ります。<br>

```csharp
switch(x)
{
  case 1:
    Console.Write("x == 1 の処理\n"); // コンパイルエラー
  case 2:
    Console.Write("x == 1 か x == 2 の処理\n");
    break;
}
```

ほとんどの場合はフォールスルーはバグの原因なのでありがたいですが、<br>
明示的にフォールスルーさせたい場合はどうすればいいのかと困惑しました。<br>

調べると `goto` でフォールスルーできるそうです。<br>

```csharp
switch(x)
{
  case 1:
    Console.Write("x == 1 の処理\n");
    goto case 2;
  case 2:
    Console.Write("x == 1 か x == 2 の処理\n");
    break;
}
```

よく考えればなるほど確かにという感じですが、まさかの方法でびっくり。
初めて `goto` 書きました。

## Reference
[条件分岐 \- C\# によるプログラミング入門 \| \+\+C\+\+; // 未確認飛行 C](http://ufcpp.net/study/csharp/st_branch.html#fallthrough)