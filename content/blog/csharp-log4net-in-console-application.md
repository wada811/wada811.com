+++
date = "2017-07-06T19:00:00+09:00"
draft = false
title = "[C#][log4net] log4net in Console Application"
tags = [
    "CSharp",
    "Console Application",
    "log4net",
]

+++

## log4net の設定

`AssemblyInfo.cs` で設定してもログが出力されなくて、<br>
プログラムで `log4net.Config.XmlConfigurator.Configure()` を呼び出す必要がある。

```csharp
using log4net.Config;

class Program
{
    static int Main(string[] args)
    {
        XmlConfigurator.Configure();
        var success = new YourConsoleApplication().Run();
        return success ? 0 : 1;
    }
}
```

また、`log4net.config` として設定ファイルを分割できなくて<br>
`App.config` に記述するしかないっぽい。


