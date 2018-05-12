---
date: "2017-06-23T07:53:00"
title: "[Android] RecyclerView inside NestedScrollView"
draft: true
tags: [
    "Android"
]

---

<blockquote class="twitter-tweet" data-lang="ja"><p lang="ja" dir="ltr">Android で 要素数固定のリスト を ScrollView に突っ込むベストプラクティスって まだ ListView のアイテムの高さと要素数から全体の高さを計算するやつなの？</p>&mdash; wada811 (@wada811) <a href="https://twitter.com/wada811/status/875137639917039616">2017年6月14日</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

それ `RecyclerView` を `NestedScrollView` に突っ込めばできるよ。

## TL;DR

- `RecyclerView` の `height` を `wrap_content` にする
- `isAutoMeasureEnabled` が `true` の `LayoutManager` を使用する
- `ScrollView` ではなく `NestedScrollView` を使用する
- `RecyclerView` に `android:nestedScrollingEnabled="false"` を指定する
- `NestedScrollView` の 直接の子 `ViewGroup` に `android:descendantFocusability="blocksDescendants"` を指定する

```
<android.support.v4.widget.NestedScrollView
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    >
    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:descendantFocusability="blocksDescendants"
        android:orientation="vertical"
        >
        <ImageView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:src="@drawable/ic_pickup_header"
            />
        <android.support.v7.widget.RecyclerView
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:nestedScrollingEnabled="false"
            app:itemLayout="@{@layout/list_item_pickup}"
            app:items="@{viewModel.listPickup}"
            app:layoutManager="android.support.v7.widget.LinearLayoutManager"
            />
        ...
    </LinearLayout>
</android.support.v4.widget.NestedScrollView>
```