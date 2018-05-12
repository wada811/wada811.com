---
date: "2015-06-15T08:07:37+09:00"
draft: false
title: "[Android] Espresso で他の Activity を起動する"
tags: [
    "Android",
    "Espresso",
]

---

## ActivityTestRule を使う

```java
ActivityTestRule<OtherActivity> rule = new ActivityTestRule<>(clazz);
rule.launchActivity(intent);
```

あとは起動した画面をスクリーンショット撮るとかすれば画面のテストが出来ます。<br>
[Android-DatePicker-Sample/DatePickerTest.java at master · wada811/Android-DatePicker-Sample](https://github.com/wada811/Android-DatePicker-Sample/blob/master/app/src/androidTest/java/com/wada811/android_datepicker_sample/DatePickerTest.java)

## 参考

[ActivityTestRule | Android Developers](https://developer.android.com/reference/android/support/test/rule/ActivityTestRule.html)<br>
[Square Island: Espresso 2.1: ActivityTestRule](http://blog.sqisland.com/2015/04/espresso-21-activitytestrule.html)