+++
date = "2015-02-23T09:23:06+09:00"
draft = false
title = "Markdown style check"
tags = [
    "Blog",
    "Markdown"
]

+++

## References

[Markdown Basics - User Documentation](https://help.github.com/articles/markdown-basics/)

[GitHub Flavored Markdown - User Documentation](https://help.github.com/articles/github-flavored-markdown/)

## Basic writing

### Paragraphs

テキストを1行以上の改行でパラグラフを分ける。

パラグラフ１です。パラグラフ１です。パラグラフ１です。パラグラフ１です。パラグラフ１です。パラグラフ１です。パラグラフ１です。

パラグラフ２です。パラグラフ２です。パラグラフ２です。パラグラフ２です。パラグラフ２です。パラグラフ２です。パラグラフ２です。


### Headings

# First largest headings
`#` の後、テキストを記述する。

## Second largest headings
`##` の後、テキストを記述する。

### Third largest headings
`###` の後、テキストを記述する。

#### Forth largest headings
`####` の後、テキストを記述する。

##### Fifth largest headings
`#####` の後、テキストを記述する。

###### Sixth largest headings
`######` の後、テキストを記述する。

### Blockquotes

`>` の後、テキストを記述する。

> 引用テキスト

### Styling text

`*` で囲ったテキストはイタリックになる。

`**` で囲ったテキストはボールドになる。

`~~` で囲ったテキストは打ち消しになる。

*This text will be italic*

**This text will be bold**

~~This text will be strikethrough~~

組み合わせることも可能。

*Everyone **must** attend the meeting at 5 o'clock today.*

**Everyone *must* attend the meeting at 5 o'clock today.**


## Lists

### Unordered lists

`-` の後、テキストを記述する。

- Item
- Item
- Item

### Ordered lists

`数字.` の後、テキストを記述する。

1. Item 1
2. Item 2
3. Item 3

### Nested lists

2つスペースを開ければネストできる。

- hoge
    1. hoge
    2. piyo
    3. fuga
- foo
    1. foo
    2. bar
    3. baz
- spam
    1. spam
    2. ham
    3. eggs

## Code formatting

### Inline formats

`` ` `` で囲ったテキストはコードフォーマットされる。

This is `inline code` or `inline variable` example.

    ``SELECT * FROM `users`;`` # Surround with double backquotes when escaping single backquote.

``SELECT * FROM `users`;``

### Multiple lines

```` ``` ````  で囲ったテキストはコードブロックになる。

````
```
```` ``` ````  で囲ったテキストはコードブロックになる。
```
````

### Syntax highlighting

```ruby
require 'redcarpet'
markdown = Redcarpet.new("Hello World!")
puts markdown.to_html
```

````
```ruby
require 'redcarpet'
markdown = Redcarpet.new("Hello World!")
puts markdown.to_html
```
````

## Links

`[link text](link url)`

[wada811/blog](http://blog.wada811.com/)

### URL autolinking

http://blog.wada811.com/

## Tables

```
First Header  | Second Header
------------- | -------------
Content Cell  | Content Cell
Content Cell  | Content Cell
```
First Header  | Second Header
------------- | -------------
Content Cell  | Content Cell
Content Cell  | Content Cell

```
| First Header  | Second Header |
| ------------- | ------------- |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  |
```
| First Header  | Second Header |
| ------------- | ------------- |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  |

```
| Name | Description          |
| ------------- | ----------- |
| Help      | Display the help window.|
| Close     | Closes a window     |
```
| Name | Description          |
| ------------- | ----------- |
| Help      | Display the help window.|
| Close     | Closes a window     |

```
| Name | Description          |
| ------------- | ----------- |
| Help      | ~~Display the~~ help window.|
| Close     | _Closes_ a window     |
```
| Name | Description          |
| ------------- | ----------- |
| Help      | ~~Display the~~ help window.|
| Close     | _Closes_ a window     |

```
| Left-Aligned  | Center Aligned  | Right Aligned |
| :------------ |:---------------:| -----:|
| col 3 is      | some wordy text | $1600 |
| col 2 is      | centered        |   $12 |
| zebra stripes | are neat        |    $1 |
```
| Left-Aligned  | Center Aligned  | Right Aligned |
| :------------ |:---------------:| -----:|
| col 3 is      | some wordy text | $1600 |
| col 2 is      | centered        |   $12 |
| zebra stripes | are neat        |    $1 |

