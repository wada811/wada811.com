+++
date = "2015-08-21T15:00:24+09:00"
draft = false
title = "Custom application class in Xamarin.Android"
tags = [
    "Android",
    "Xamarin.Android",
    "Xamarin",
]

+++

## Implement custom application class

```csharp
[Application]
public class MyApplication : Application
{
    public MyApplication(IntPtr handle, JniHandleOwnership ownerShip) : base(handle, ownerShip)
    {
    }
}
```

普通に実装して `AndroidManifest.xml` に追記してもダメで、
`[Application]` 属性とコンストラクタが必要でした。


## Reference
[monodroid - How to register my own Application subclass in Xamarin.Android? - Stack Overflow](http://stackoverflow.com/questions/21427981/how-to-register-my-own-application-subclass-in-xamarin-android)
