---
date: "2015-05-22T22:51:27+09:00"
draft: false
title: "Get java.lang.Class on Xamarin.Android"
tags: [
    "CSharp",
    "Xamarin",
    "Xamarin.Android",
]

---

## Xamarin.Android で Intent を生成するためにクラスを取得したい
Java だったら以下のように `MainActivity.class` で取得できる。

```java
public static Intent createIntent(Context context){
    Intent intent = new Intent(context, MainActivity.class);
    return intent;
}
```

しかし、 Xamarin.Android は C# なので Java の java.lang.Class は `.class` で取得できない。

代わりに以下のように `typeof(MainActivity)` で取得する。

```csharp
public static Intent createIntent(Context context){
    var intent = new Intent(context, typeof(MainActivity));
    return intent;
}
```

