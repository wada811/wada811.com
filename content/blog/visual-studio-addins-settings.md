+++
date = "2015-04-15T11:44:36+09:00"
draft = false
title = "[Visual Studio]アドインの読み込み"
tags = [
    "Windows",
    "Visual Studio",
    "Visual Studio 2013"
]
+++

## アドインの読み込み
アドインを入手した場合、Visual Studio からアドインを読み込むためには Visual Studio が認識できるディレクトリに置く必要があります。

### Visual Studio が認識できるディレクトリ
[ツール] > [オプション] > [環境] > [アドイン セキュリティ] を開くと、下図のようなダイアログボックスが開きます。

![](/images/visual-studio-addins-settings/VisualStudioAddinSettings.png)

|変数|パス|
|---|---|
|%ALLUSERSPROFILE%|C:\\Users\\Public|
|%APPDATA%|C:\\Users\\**username**|
|%VSAPPDATA%|C:\\Users\\**username**|
|%VSCOMMONAPPDATA%|C:\\Users\\Public|
|%VSMYDOCUMENTS%|C:\\Users\\**username**\\Documents\\Visual Studio 2013|

### 読み込み
`C:\Users\username\Documents\Visual Studio 2013\Addins` に保存して再起動すれば読み込まれます。

## 参考
[アドインの格納 | Visual Studio アドイン](http://www.kanazawa-net.ne.jp/~pmansato/vs/vs_addin.htm#store)