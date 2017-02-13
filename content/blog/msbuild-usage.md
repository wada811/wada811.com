+++
draft = false
title = "MSBuild で Visual Studio プロジェクトをビルドする"
tags = [
    "Microsoft",
    "Windows",
    "Visual Studio",
    "MSBuild",
]

+++

## 環境

|ツール|バージョン|
|---|---|
|Visual Studio|2015|
|MSBuild|14.0.25420.1|

##
```PowerShell
MSBuild.exe /t:Rebuild /p:Configuration=Debug ~\path\to\solution.sln
```
```PowerShell
MSBuild.exe /t:Rebuild /p:Configuration=Debug ~\path\to\project.csproj
```

MSBuild Command-Line Reference https://msdn.microsoft.com/ja-jp/library/ms164311.aspx

MSBuild オプション基礎文法最速マスター - secretbase.log http://cointoss.hatenablog.com/entry/2012/09/14/220425