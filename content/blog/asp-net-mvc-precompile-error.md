+++
date = "2017-06-21T19:54:00+09:00"
draft = false
title = "[ASP.NET MVC] Microsoft.VisualStudio.Web.PageInspector.Loader が読み込めないのでプリコンパイルして発行できない"
tags = [
    "ASP.NET MVC"
]

+++

## 試行錯誤編

### Visual Studio を再インストールすれば動く説
動かなかった。

### システムの web.config を編集すれば動く説

- `C:\Windows\Microsoft.NET\Framework\v4.0.30319\Config\web.config`
- `C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Config\web.config`

上記の2ファイルから以下の記述を削除すれば動く。

```xml
<remove assembly="Microsoft.VisualStudio.Web.PageInspector.Loader, Version=1.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" />
<add assembly="Microsoft.VisualStudio.Web.PageInspector.Loader, Version=1.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" />
```

という記述を見て試すも、同様のエラーが次々発生する。<br/>
同様に削除していくと最終的に以下のようになった。

```xml
<assemblies>
    <add assembly="mscorlib" />
    <add assembly="System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" />
    <add assembly="System.Configuration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" />
    <add assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" />
    <add assembly="System.Xml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" />
    <add assembly="System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" />
    <add assembly="System.Core, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" />
    <add assembly="*" />
</assemblies>
```

しかし、以下の監視の開始に失敗したというエラーが発生して結局動かない。

`C:\Users\{userName}\AppData\Local\Temp\Temporary ASP.NET Files\root\4c0311a5\af7a6d90\hash`

## 解決編

動かなかったので `web.config` は元に戻した。<br/>
監視の開始に失敗したというエラーからなんとなく権限かなぁと思い、<br/>
`常に管理者権限を得る`ことで解決した。

直ったが理屈は分からないのでモヤモヤする。

**ぜんぜんわからない**
**俺達は雰囲気で ASP.NET をやっている**

## Reference
[\[Windows\] 常に管理者権限を得る \| wada811\.com](https://wada811.com/blog/windows-always-admin/)

