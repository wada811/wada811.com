+++
date = "2017-06-28T08:07:37+09:00"
draft = false
title = "[JavaScript][jQuery] focus() が IE で動かない"
tags = [
    "JavaScript",
    "jQuery",
    "Internet Explorer",
]

+++

## Problem

[Bootstrap Table](http://bootstrap-table.wenzhixin.net.cn/) でカラム別の検索機能を使用していたら<br>
IE で検索するとフォーカスが自動で最後のカラムの検索用テキストボックスに移るというバグがあり…。<br>
<br>
仕方ないのでフォーカスを直してあげようと思ったが IE で動かず…。<br>

## Solution

`setTimeout` で動くようになる。<br>
`delay` はなんでも良いが、`0`にしておけばブラウザが自動で最速で実行してくれる。

```javascript
setTimeout(function(){
    $(element).focus();
}, 0);
```

## Reference

- [filter lost focus after table refreshed · Issue \#2870 · wenzhixin/bootstrap\-table · GitHub](https://github.com/wenzhixin/bootstrap-table/issues/2870)
- [JQuery focus\(\) is not focusing in IE but it is in Chrome \- Stack Overflow](https://stackoverflow.com/questions/7996577/jquery-focus-is-not-focusing-in-ie-but-it-is-in-chrome)
