+++
date = "2016-07-31T22:19:00.974+09:00"
draft = false
title = "[Android]テキスト選択時に Toolbar を隠す"
tags = [  ]
+++
テキスト選択時に Contextual Action Bar が表示されますが、Toolbar と二重に表示されてしまいました。

テーマに以下を追加すれば Contextual Action Bar が表示されている時は Toolbar が表示されないようになります。

```android
<item name="windowActionMode">true</item>
```