+++
date = "2017-06-28T19:07:37+09:00"
draft = false
title = "[Visual Studio] プログラム exe を開始できません。この要求はサポートされていません。"
tags = [
    "Visual Studio",
    "Visual Studio 2017",
]

+++

## Problem

Console Application を実行しようとすると、以下のエラーが発生して実行できない。

![プログラム exe を開始できません。この要求はサポートされていません。](/images/visual-studio-cannot-start-console-application/visual-studio-cannot-start-console-application-problem.png)

> プロジェクトを実行しようとしている時にエラーが発生しました：
> プログラム '***.exe' を開始できません。
>
> この要求はサポートされていません。

## Solution

- プロジェクトのプロパティを開く
- ビルドのタブを開く
- [32 ビットを優先] のチェックを外す

![(32 ビットを優先) のチェックを外す](/images/visual-studio-cannot-start-console-application/visual-studio-cannot-start-console-application-solution.png)

## Reference

- [VisualStudioでデバッグ起動エラーが出る場合の対処法。「MSVSMON\.EXEを起動できませんでした」](http://www.jami2010.com/vs-debug-error-msvsmonexe/)