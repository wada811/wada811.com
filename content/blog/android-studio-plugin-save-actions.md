+++
date = "2017-01-23T07:54:00+09:00"
draft = false
title = "Android Studio Plugin: Save Actions"
tags = [
    "Android",
    "Android Studio",
    "Android Studio Plugin",
]

+++

## Why

Android Studio の標準機能では Eclipse のようにファイル保存時にフォーマッタをかけてくれる Save Action がありません。<br>
手動でフォーマッタをかけるしかなかったため、手間がかかっていました。<br>
Save Actions プラグインを導入することにより、ファイル保存時に自動でフォーマッタをかけることができます。

## Install
1. [Save Actions for IntelliJ IDEA :: JetBrains Plugin Repository](https://plugins.jetbrains.com/idea/plugin/7642-save-actions) から jar ファイルをダウンロード
1. Android Studio の Preference > Plugins > Install plguin from disk... からダウンロードした jar ファイルを選択してインストール
1. Android Studio を再起動

## Settings
- Android Studio の Preference > Other Settings > Save Actions を開く
- 以下の設定を確認する

![Android Studio の Preference > Other Settings > Save Actions](/images/android-studio-plugin-save-actions/SaveActionsSettings.png)

## References
- [Save Actions for IntelliJ IDEA :: JetBrains Plugin Repository](https://plugins.jetbrains.com/idea/plugin/7642-save-actions)
- [dubreuia/intellij\-plugin\-save\-actions: Supports configurable, Eclipse like, save actions, including "organize imports", "reformat code" and "rearrange code"\.](https://github.com/dubreuia/intellij-plugin-save-actions)