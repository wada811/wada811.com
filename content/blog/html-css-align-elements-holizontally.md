---
date: "2017-06-15T17:54:00+09:00"
title: "[HTML][CSS] 要素を横並びにする"
draft: false
tags: [
	"HTML",
	"CSS"
]

---

<style>
	h2 {
		margin-top: 60px;
	}
</style>

1. [float + clearfix](#1)
2. [display: inline-block; + letter-spacing: -1em;](#2)
3. [display: table-cell;](#3)
3. [display: flex;](#3)

<a name="1"></a>
## float + clearfix

```css
.clearfix::after {
	content: "";
	display: table;
	clear: both;
}
.holizontal1 {
	float: left;
}
/* IE8 以下は以下のハックが必要 */
.clearfix--for-under-ie8:before,
.clearfix--for-under-ie8:after {
	content: " ";
	display: table;
}

.clearfix--for-under-ie8:after {
	clear: both;
}

.clearfix--for-under-ie8 {
	*zoom: 1; /* for IE 6/7 only */
}
```

```html
<div class="clearfix clearfix--for-under-ie8">
	<div class="holizontal1" style="background-color: #cff;">要素1</div>
	<div class="holizontal1" style="background-color: #fcf;">要素2<br>要素2</div>
	<div class="holizontal1" style="background-color: #ffc;">要素3<br>要素3<br>要素3</div>
</div>
```

### 例
<style>
.clearfix::after {
	content: "";
	display: table;
	clear: both;
}
.holizontal1 {
	float: left;
}
/* IE8 以下は以下のハックが必要 */
.clearfix--for-under-ie8:before,
.clearfix--for-under-ie8:after {
	content: " ";
	display: table;
}

.clearfix--for-under-ie8:after {
	clear: both;
}

.clearfix--for-under-ie8 {
	*zoom: 1; /* for IE 6/7 only */
}
</style>

<div class="clearfix clearfix--for-under-ie8">
	<div class="holizontal1" style="background-color: #cff;">要素1</div>
	<div class="holizontal1" style="background-color: #fcf;">要素2<br>要素2</div>
	<div class="holizontal1" style="background-color: #ffc;">要素3<br>要素3<br>要素3</div>
</div>










<a name="2"></a>
## display: inline-block; + letter-spacing: -1em;

```css
.holizontal2__parent {
	letter-spacing: -1em;
}

.holizontal2__child {
	display: inline-block;
	letter-spacing: normal;
}
/* IE7 以下は以下のハックが必要 */
.holizontal2__child--for-under-ie7 {
	*display: inline;
	*zoom: 1;
}
```

```html
<div class="holizontal2__parent">
	<div class="holizontal2__child" style="background-color: #cff;">要素1</div>
	<div class="holizontal2__child" style="background-color: #fcf;">要素2<br>要素2</div>
	<div class="holizontal2__child" style="background-color: #ffc;">要素3<br>要素3<br>要素3</div>
</div>
```

### 例

<style>
.holizontal2__parent {
	letter-spacing: -1em;
}

.holizontal2__child {
	display: inline-block;
	letter-spacing: normal;
}
/* IE7 以下は以下のハックが必要 */
.holizontal2__child--for-under-ie7 {
	*display: inline;
	*zoom: 1;
}
</style>

<div class="holizontal2__parent">
	<div class="holizontal2__child holizontal2__child--for-under-ie7" style="background-color: #cff;">要素1</div>
	<div class="holizontal2__child holizontal2__child--for-under-ie7" style="background-color: #fcf;">要素2<br>要素2</div>
	<div class="holizontal2__child holizontal2__child--for-under-ie7" style="background-color: #ffc;">要素3<br>要素3<br>要素3</div>
</div>

<br>
文字の位置は `vertical-align` で調整可能。

```html
<div class="holizontal2__parent">
	<div class="holizontal2__child holizontal2__child--for-under-ie7" style="vertical-align: top; background-color: #cff;">要素1</div>
	<div class="holizontal2__child holizontal2__child--for-under-ie7" style="vertical-align: top; background-color: #fcf;">要素2<br>要素2</div>
	<div class="holizontal2__child holizontal2__child--for-under-ie7" style="vertical-align: top; background-color: #ffc;">要素3<br>要素3<br>要素3</div>
</div>
```

<div class="holizontal2__parent">
	<div class="holizontal2__child holizontal2__child--for-under-ie7" style="vertical-align: top; background-color: #cff;">要素1</div>
	<div class="holizontal2__child holizontal2__child--for-under-ie7" style="vertical-align: top; background-color: #fcf;">要素2<br>要素2</div>
	<div class="holizontal2__child holizontal2__child--for-under-ie7" style="vertical-align: top; background-color: #ffc;">要素3<br>要素3<br>要素3</div>
</div>







<a name="3"></a>
## display: table-cell;

```css
.holizontal3 {
	display: table-cell;
}
```

```html
<div>
	<div class="holizontal3" style="background-color: #cff;">要素1</div>
	<div class="holizontal3" style="background-color: #fcf;">要素2<br>要素2</div>
	<div class="holizontal3" style="background-color: #ffc;">要素3<br>要素3<br>要素3</div>
</div>
```

### 例

<style>
.holizontal3 {
	display: table-cell;
}
</style>

<div>
	<div class="holizontal3" style="background-color: #cff;">要素1</div>
	<div class="holizontal3" style="background-color: #fcf;">要素2<br>要素2</div>
	<div class="holizontal3" style="background-color: #ffc;">要素3<br>要素3<br>要素3</div>
</div>






<a name="4"></a>
## display: flex;

```css
.holizontal4 {
	display: flex;
}
```

```html
<div class="holizontal4">
	<div style="background-color: #cff;">要素1</div>
	<div style="background-color: #fcf;">要素2<br>要素2</div>
	<div style="background-color: #ffc;">要素3<br>要素3<br>要素3</div>
</div>
```

### 例

<style>
.holizontal4 {
	display: flex;
}
</style>

<div class="holizontal4">
	<div style="background-color: #cff;">要素1</div>
	<div style="background-color: #fcf;">要素2<br>要素2</div>
	<div style="background-color: #ffc;">要素3<br>要素3<br>要素3</div>
</div>




