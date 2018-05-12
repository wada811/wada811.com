---
date: "2015-08-19T15:26:05+09:00"
draft: false
title: "Quick Command-line File Completion by peco"
tags: [
    "peco",
    "zsh",
]

---

## きっかけ

<blockquote class="twitter-tweet" lang="ja"><p lang="ja" dir="ltr">これ、便利だな。peco 以来の life changing なツールかもしれない。 / Quick Command-line File Completion <a href="https://t.co/8HH8nKDEa2">https://t.co/8HH8nKDEa2</a></p>&mdash; Hiroshi Kurokawa (@hydrakecat) <a href="https://twitter.com/hydrakecat/status/625112129272582144">2015, 7月 26</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

## それ peco でもできるよ

[https://github.com/wada811/dotfiles/commit/194702f](https://github.com/wada811/dotfiles/commit/194702f)

```zsh
function peco-select-file() {
    LBUFFER+=$(\find . | \peco)
    CURSOR=$#LBUFFER
}
zle -N peco-select-file

# 一覧からファイルを選択
bindkey '^f' peco-select-file
```

## Ctrl + F でファイル選択

[![quick-command-line-file-completion-by-peco](/images/quick-command-line-file-completion-by-peco/quick-command-line-file-completion-by-peco.gif)](https://gyazo.com/1534b6e12d9410287a003c81377515b6)

## peco が最強すぎるんだよなぁ

以上です。