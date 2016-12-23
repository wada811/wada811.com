+++
date = "2016-12-23T13:45:00+09:00"
draft = false
title = "pod install が失敗する Build Settings を修正する"
tags = [
    "iOS",
    "XCode",
    "CocoaPods",
    "Swift"
]

+++

## 環境

|ツール|バージョン|
|---|---|
|XCode|7.3.1|
|Swift|2.3|
|CocoaPods|1.1.1|

## EMBEDDED_CONTENT_CONTAINS_SWIFT

### 問題

`pod install` のエラーメッセージに以下のメッセージが表示される。

```
[!] The `~~~` target overrides the `EMBEDDED_CONTENT_CONTAINS_SWIFT` build setting defined in `Pods/Target Support Files/~~~.xcconfig'. This can lead to problems with the CocoaPods installation
    - Use the `$(inherited)` flag, or
    - Remove the build settings from the target.
```

### 解決法

1. `~~~` Taget の Build Settings を開く。
1.  `EMBEDDED_CONTENT_CONTAINS_SWIFT` で検索。
1. 値を `$(inherited)` に書き換える。
1. 再度 `pod install` する。


## ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES

### 問題

`pod install` のエラーメッセージに以下のメッセージが表示される。

```
[!] The `~~~` target overrides the `ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES` build setting defined in `Pods/Target Support Files/~~~.xcconfig'. This can lead to problems with the CocoaPods installation
    - Use the `$(inherited)` flag, or
    - Remove the build settings from the target.
```

### 解決法

1. `~~~` Taget の Build Settings を開く。
1.  `ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES` で検索。
1. 値を `$(inherited)` に書き換える。
1. 再度 `pod install` する。