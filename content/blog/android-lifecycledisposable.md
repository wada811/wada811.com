---
date: "2019-01-24T09:33:00"
title: "[Android] AAC Lifecycle で自動的に dispose するライブラリ LifecycleDisposable を公開しました"
draft: false
tags: [
    "Android",
    "Android Architecture Components",
    "Lifecycle",
    "RxJava"
]

---

## LifecycleDisposable とは
[wada811/LifecycleDisposable: Dispose automatically RxJava2 streams using AAC Lifecycle\.](https://github.com/wada811/LifecycleDisposable/)

LifecycleDisposable は [Android Architecture Components Lifecycle](https://developer.android.com/topic/libraries/architecture/lifecycle) を使って Subscribe 時の Lifecycle State に対応する Lifecycle down event で自動的に RxJava2 のストリームを dispose してくれるライブラリです。

端的に言えば、[trello/RxLifecycle](https://github.com/trello/RxLifecycle), [uber/AutoDispose](https://github.com/uber/AutoDispose) の再発明です。AAC Lifecycle を使用しているので Android 限定になりますが、その分シンプルで理解しやすく、メソッド数の増加も抑えられます。

## LifecycleDisposable の使い方

以下のように FragmentActivity/Fragment で `subscribe` 後に `disposeOnLifecycle` を呼び出すだけです。

```kotlin
class MainActivity : FragmentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        Observable.just("LifecycleDisposable")
            .subscribe()
            .disposeOnLifecycle(this) // dispose when onDestroy is called
    }
}
```

`dispose` するタイミングは `subscribe` したタイミングに依存します。<br>

|subscribe したタイミング|dispose するタイミング|
|---|---|
|onCreate|onDestroy|
|onStart|onStop|
|onResume|onPause|

RxPermissions などのように `onPause` で `dispose` されると困る場合があるので、`dispose` するタイミングを以下のように `Lifecycle.Event` で指定できるようにしています。

```kotlin
Observable.just("LifecycleDisposable")
    .subscribe()
    .disposeOnLifecycle(this, Lifecycle.Event.ON_DESTROY) // dispose when onDestroy is called
```

## LifecycleDisposable の使い所

RxBinding や RxPermissions などの View 側で RxJava を扱う際に使えると思います。


## さいごに

ぜひ ⭐️ つけていってください 🤩
[wada811/LifecycleDisposable](https://github.com/wada811/LifecycleDisposable/)
