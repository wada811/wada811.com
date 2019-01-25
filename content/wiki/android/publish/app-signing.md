---
date: "2018-09-10"
title: "Android > Publish > Sign app"
draft: false
tags: [
    "Android",
]

---

## debug.keystore 作成

```
keytool -genkey -v -keystore debug.keystore -alias androiddebugkey -keyalg RSA -validity 10000 -dname "CN=Android Debug,O=Android,C=US"
```

## references

[Sign your app  \|  Android Developers](https://developer.android.com/studio/publish/app-signing)