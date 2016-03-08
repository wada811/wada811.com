+++
date = "2015-09-16T20:14:49+09:00"
draft = false
title = "[Android]アプリのレビューを Slack に通知する"
tags = [
    "Android",
    "Slack"
]

+++

> [Post Google Play App. Reviews to Slack | wada811's gist ](https://gist.github.com/wada811/5f6469f043daea5bcb5b)
> ### 参考
> - Android - アプリのレビューを HipChat で自動通知する - Qiita http://qiita.com/hkurokawa/items/9241055f5d34b4dd4782
> - Google Play のレビューを自動通知する // Speaker Deck https://speakerdeck.com/hkurokawa/google-play-falserebiyuwozi-dong-tong-zhi-suru
>
> ### 修正箇所一覧
> - mktemp が GNU 版で引数が不要だった。
> - パス通すのが面倒だったので同じ場所においてあれば動くようにした。
> - 各種定数について環境変数を設定するのが面倒だったのでベタ書きした。
> - Slack に投稿する際のフォーマットを調整した。
