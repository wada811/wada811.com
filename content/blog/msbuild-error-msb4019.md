---
draft: false
date: "2017-02-13T17:54:00+09:00"
title: "MSBuild error MSB4019: Microsoft.WebApplication.targets が見つかりませんでした。"
tags: [
    "Microsoft",
    "Windows",
    "Visual Studio",
    "MSBuild",
]

---

## 環境

|ツール|バージョン|
|---|---|
|Visual Studio|2015|
|MSBuild|14.0.25420.1|

## 経緯
MSBuild.exe でコマンドラインでビルドしようとすると以下のエラーが発生した。

## エラー

> error MSB4019: インポートされたプロジェクト
> "C:\Program Files (x86)\MSBuild\Microsoft\VisualStudio\v10.0\WebApplications\Microsoft.WebApplication.targets"
> が見つかりませんでした。
> <Import> 宣言のパスが正しいかどうか、およびファイルがディスクに存在しているかどうかを確認してください。

## 対処

~~`C:\Program Files (x86)\MSBuild\Microsoft\VisualStudio\` 以下に `v14.0` フォルダがあり、~~<br>
~~`WebApplications\Microsoft.WebApplication.targets` が存在するため、~~<br>
~~フォルダをコピーして名前を `v10.0`に変更する。~~

古い `C:\Windows\Microsoft.NET\Framework64\v4.0.30319` の `MSBuild.exe` を使用していたので
新しい `C:\Program Files (x86)\MSBuild\14.0\Bin` の `MSBuild.exe` を使用する。
