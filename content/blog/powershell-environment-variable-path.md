+++
draft = false
title = "PowerShell で環境変数 PATH を参照・追加する"
tags = [
    "Microsoft",
    "Windows",
    "PowerShell",
]

+++

## 環境

|ツール|バージョン|
|---|---|
|PowerShell|5.0.10586.117|

## コマンド

### 参照する

```PowerShell
$env:Path.split(";")
```

```PowerShell
Get-Item Env:Path | Format-Table -AutoSize
```

```PowerShell
[Environment]::GetEnvironmentVariable('PATH', 'Machine')
```

### 追加する
管理者権限が必要。

```PowerShell
$env:Path += ";C:\Program Files (x86)\MSBuild\14.0\Bin"
```

```PowerShell
Set-Item Env:Path "$Env:Path;C:\Program Files (x86)\MSBuild\14.0\Bin"
```

```PowerShell
$path = [Environment]::GetEnvironmentVariable('PATH', [System.EnvironmentVariableTarget]::Machine)
$path += ";C:\Program Files (x86)\MSBuild\14.0\Bin"
[Environment]::SetEnvironmentVariable('PATH', $path, [System.EnvironmentVariableTarget]::Machine)
```