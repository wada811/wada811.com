---
date: "2017-07-04T19:07:37+09:00"
draft: false
title: "[C#] 現在の接続と関連付けられているトランザクションは完了しましたが、破棄されていません。トランザクションは、接続が SQL ステートメントの実行に使用される前に破棄されなければなりません。"
tags: [
    "CSharp",
]

---

## Problem

トランザクションのデフォルトのタイムアウトの1分を過ぎると以下のエラーが発生する。

> 現在の接続と関連付けられているトランザクションは完了しましたが、破棄されていません。<br>
> トランザクションは、接続が SQL ステートメントの実行に使用される前に破棄されなければなりません。

## Solution

`TransactionScope` のコンストラクタで `Timeout` の値を設定する。<br>
最大10分までしか設定できない。10分以上を設定しても10分になる。

```csharp
using(var transactionScope = new TransactionScope(TransactionScopeOption.Required, TimeSpan.FromMinutes(10.0)))
{
    // database operation
}
```

## 10分以上を設定したい場合
`machine.config` に以下の設定を追加する必要がある。<br>
サーバー単位での設定になる。

```
<configuration>
  <system.transactions>
    <machineSettings maxTimeout="01:00:00" />
  </system.transactions>
</configuration>
```

`machine.config` は以下のパスにある。

**32 bit**

> %windir%\Microsoft.NET\Framework\\***version***\Config\machine.config

**64 bit**

> %windir%\Microsoft.NET\Framework64\\***version***\Config\machine.config


## 確認方法

`TransactionManager.MaximumTimeout` の値を確認する。


## Reference

- [TransactionScope Constructor \(Transaction, TimeSpan\) \(System\.Transactions\)](https://msdn.microsoft.com/en-us/library/ms149852.aspx)
- [MachineSettingsSection\.MaxTimeout Property \(System\.Transactions\.Configuration\)](https://msdn.microsoft.com/en-us/library/system.transactions.configuration.machinesettingssection.maxtimeout.aspx)
- [MachineSettingsSection Class \(System\.Transactions\.Configuration\)](https://msdn.microsoft.com/en-us/library/system.transactions.configuration.machinesettingssection.aspx#Anchor_6)
- [Machine Configuration Files](https://msdn.microsoft.com/en-us/library/ms229697.aspx)
- [TransactionManager\.MaximumTimeout Property \(System\.Transactions\)](https://msdn.microsoft.com/en-us/library/system.transactions.transactionmanager.maximumtimeout.aspx)
