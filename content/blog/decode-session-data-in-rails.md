---
date: "2015-08-28T22:34:01+09:00"
draft: false
title: "Decode session data in Rails"
tags: [
    "Ruby",
    "Rails"
]

---

Rails の Session データは marshal して base64 されている。<br>
`marshal`: オブジェクトのシリアライズ関数

Session の中身を見たいときは以下のコードでデコードできる。

```ruby
data = "BAhJIhFzZXNzaW9uIGRhdGEGOgZFVA==\n" # session data
Rack::Session::Cookie::Base64::Marshal.new.decode(data)
```