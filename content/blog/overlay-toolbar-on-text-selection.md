+++
date = "2016-07-31T22:19:29.407+09:00"
draft = false
title = "[Android]テキスト選択時に Toolbar を隠す"
tags = [ "Android" ]
+++
テキスト選択時に Contextual Action Bar が表示されますが、Toolbar と二重に表示されてしまいました。

テーマに以下を追加すれば Contextual Action Bar が表示されている時は Toolbar が表示されないようになります。

```
<item name="windowActionModeOverlay">true</item>
```

### 参考
[android - Overlay or hide Toolbar on copy/cut selection - Stack Overflow](http://stackoverflow.com/questions/27064335/overlay-or-hide-toolbar-on-copy-cut-selection)