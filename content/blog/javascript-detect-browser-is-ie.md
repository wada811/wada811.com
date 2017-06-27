+++
date = "2017-06-27T08:07:37+09:00"
draft = false
title = "[JavaScript] UserAgent でブラウザが IE か判定する"
tags = [
    "JavaScript",
    "Internet Explorer",
]

+++

## IE か判定する

```javascript
var userAgent = window.navigator.userAgent.toLowerCase();
var isIE = (userAgent.indexOf('msie') >= 0 || userAgent.indexOf('trident') >= 0);
```

### IE のバージョンを取得する

```javascript
var version = userAgent.match(/(msie\s|rv:)([\d\.]+)/)[2];
```

## 参考

- [UserAgent を 用いた IE11 の判別方法 \- galife](https://garafu.blogspot.jp/2013/08/useragent-ie11.html)