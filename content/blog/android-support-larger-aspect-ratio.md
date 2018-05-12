---
date: "2017-10-20T07:36:00"
title: "[Android] Galaxy S8 などの高アスペクト比端末でのフルスクリーン対応"
draft: true
tags: [
    "Android"
]

---

## Why

Galaxy S8 などの高アスペクト比端末では 18.5:9 などのアスペクト比になっているが、
デフォルトでは 16:9 として表示されるため、上下に黒帯が入る。
広いディスプレイを最大限使いたいため、フルスクリーン対応を行いたい。

## How

### Android 7.1 以下

`AndroidManifest.xml` の `<application>` タグに以下のタグを追加する。

```xml
<meta-data android:name="android.max_aspect" android:value="2.1" />
```

Galaxy S8 が 18.5:9 でアスペクト比が 2.05(≒ 2.1) なので 2.1 以上を指定することを推奨.


### Android 8.0 以上

```xml

```

## References

- [Android Developers Blog: Update your app to take advantage of the larger aspect ratio on new Android flagship devices](https://android-developers.googleblog.com/2017/03/update-your-app-to-take-advantage-of.html)
- [Google Developers Japan: アプリをアップデートして Android の新しいハイエンド端末で大きなアスペクト比を活用する](https://developers-jp.googleblog.com/2017/04/update-your-app-to-take-advantage-of.html)
- [Declaring screen size support - Supporting Multiple Screens \| Android Developers](https://developer.android.com/guide/practices/screens_support.html#MaxAspectRatio)
