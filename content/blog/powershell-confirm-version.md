+++
draft = false
date = "2017-02-13T17:54:00+09:00"
title = "PowerShell のバージョンを確認する"
tags = [
    "Microsoft",
    "Windows",
    "PowerShell",
]

+++

## コマンド

```PowerShell
$PSVersionTable
```

> Name                           Value
----                           -----
PSVersion                      5.0.10586.117
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}
BuildVersion                   10.0.10586.117
CLRVersion                     4.0.30319.42000
WSManStackVersion              3.0
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1


```PowerShell
$PSVersionTable.PSVersion
```

> Major  Minor  Build  Revision
-----  -----  -----  --------
5      0      10586  117
