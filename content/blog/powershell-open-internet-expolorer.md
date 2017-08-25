+++
date = "2017-08-25T19:47:05+09:00"
draft = false
title = "[PowerShell] open Internet Explorer"
tags = [
    "PowerShell",
    "Internet Explorer"
]

+++

## PowerShell で IE を開く Script (`OpenIE.ps1`)

```PowerShell
$ie = New-Object -ComObject InternetExplorer.Application # IE起動
$ie.Navigate($Args[0])                                   # URL指定
$ie.Visible = $true                                      # 表示
```

## 使い方

`PS> ./OpenIE.ps1 https://wada811.com`

## References

- [InternetExplorer object \(Windows\)](https://msdn.microsoft.com/ja-jp/library/aa752084.aspx)
- [Navigate method \(Internet Explorer\)](https://msdn.microsoft.com/ja-jp/library/aa752093.aspx)