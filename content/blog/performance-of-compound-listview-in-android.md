---
date: "2015-06-28T09:05:54+09:00"
draft: false
title: "[Android] Compound ListView のパフォーマンス、あるいは MergeAdapter が便利という話"
tags: [
    "Android"
]
---

## Compound ListView とは

ListView に異なる種類のView、特に ListView を含む ListView のこと。（命名、俺）

例↓
```
┌──────────────┐
│┌────────────┐│
││  TextView  ││
│└────────────┘│
│┌────────────┐│
││  ListView  ││
│└────────────┘│
│┌────────────┐│
││   Button   ││
│└────────────┘│
│┌────────────┐│
││  TextView  ││
│└────────────┘│
│┌────────────┐│
││  ListView  ││
│└────────────┘│
│┌────────────┐│
││   Button   ││
│└────────────┘│
└──────────────┘
```

## Sample Code

[wada811/Android-Compound-ListView-Sample](https://github.com/wada811/Android-Compound-ListView-Sample)

## 実装方法

### Views in ScrollView

普通に ScrollView に View を入れていく方法。<br>
ListView は ScrollView の中ではアイテム１個分の高さしか表示されないので<br>
以下のようなコードを書いて全件の高さを計算して ListView の高さを設定する必要がある。<br>

```java
ListAdapter listAdapter = listView.getAdapter();
if(listAdapter == null){
    return;
}
int totalHeight = listView.getPaddingTop() + listView.getPaddingBottom();
for(int i = 0; i < listAdapter.getCount(); i++){
    View listItem = listAdapter.getView(0, null, listView);
    if(listItem instanceof ViewGroup){
        listItem.setLayoutParams(new LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT));
    }
    listItem.measure(0, 0);
    totalHeight += listItem.getMeasuredHeight();
}

ViewGroup.LayoutParams params = listView.getLayoutParams();
params.height = totalHeight + (listView.getDividerHeight() * (listAdapter.getCount() - 1));
listView.setLayoutParams(params);
```

### MergeAdapter

[commonsguy/cwac-merge](https://github.com/commonsguy/cwac-merge)

[Android - MergeAdapterが便利 - Qiita](http://qiita.com/yyaammaa/items/d31dc8f67da87ca36574)

MergeAdapter というライブラリを使って ListView に様々な View を入れていく方法。<br>

```java
ListView listView = (ListView)findViewById(R.id.ListView);

MergeAdapter mergeAdapter = new MergeAdapter();

View view = LayoutInflater.from(this).inflate(R.layout.list, null, false);

TextView textView1 = (TextView)view.findViewById(R.id.TextView1);
ListView listView1 = (ListView)view.findViewById(R.id.ListView1);
Button button1 = (Button)view.findViewById(R.id.Button1);
TextView textView2 = (TextView)view.findViewById(R.id.TextView2);
ListView listView2 = (ListView)view.findViewById(R.id.ListView2);
Button button2 = (Button)view.findViewById(R.id.Button2);

mergeAdapter.addView(textView1);
mergeAdapter.addAdapter(listView1.getAdapter());
mergeAdapter.addView(button1);
mergeAdapter.addView(textView2);
mergeAdapter.addAdapter(listView2.getAdapter());
mergeAdapter.addView(button2);

listView.setAdapter(mergeAdapter);
```

## パフォーマンス

### Views in ScrollView

実装方法を見て分かる通り、ListView の要素を全て getView して高さを計算するので<br>
ListView の要素数が大きくなると描画までの時間が長くなる。

### MergeAdapter

MergeAdapter に追加しているのは Adapter なので画面に表示されない部分は描画されない。
また、View も内部的に Adapter に変換されているのでパフォーマンスが良い。

## クリックイベントのハンドリング

### Views in ScrollView

通常と変わらない。

### MergeAdapter

`MergeAdapter`をセットした`ListView`で`setOnItemClickListener`をセットしても<br>
クリックイベントが取得できるのは`addAdapter`で追加したものだけ。<br>
`Button`などの`View`を追加した場合は、そちらにリスナーをセットしなければならない。<br>
`Adapter`は追加した全ての`View`の中での`position`になっているので扱いにくい。<br>
なので`Adapter`は内部で`View`に対してリスナーをセットしたほうが良いと思う。

## まとめ

`MergeAdapter`は便利。
だけどクリックイベントのハンドリングが少し微妙。