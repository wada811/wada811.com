---
date: "2017-06-21T17:54:00+09:00"
draft: false
title: "[Windows] 常に管理者権限を得る"
tags: [
    "Windows"
]

---

## セキュリティ上のリスクがあります。自己責任でどうぞ。

レジストリエディターで以下のキーの `EnableLUA` を `0` に変更して再起動する。
`HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System`

## Reference
[常に管理者特権を得る方法 \- マイクロソフト コミュニティ](https://answers.microsoft.com/ja-jp/windows/forum/windows_8-security/%E5%B8%B8%E3%81%AB%E7%AE%A1%E7%90%86%E8%80%85/a8226a91-938e-4717-858a-2bdcfec44826)