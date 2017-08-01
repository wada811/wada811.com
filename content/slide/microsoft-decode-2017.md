+++
date = "2017-07-21T19:00:00+09:00"
draft = false
title = "Microsoft de:code 2017 参加報告"
tags = [
    "Microsoft",
    "de:code",
]

+++

class: middle, center

# Microsoft de:code 2017

## 参加報告


.right[2017/07/28]
---
## Agenda

1. de:code とは
2. Keynote
3. AI
4. 個人的に面白かったセッション

---

## de:code とは

日本マイクロソフトが開催した<br>
Microsoft のビジョンと最新テクノロジーを紹介するイベントです。<br>
「Build 2017」で発表された内容も紹介されています。

### 日程
5月23日、5月24日の2日間

## 詳しくはこちら
[Overview \- de:code \(decode\) 2017 ｜ 日本マイクロソフトの開発者/アーキテクト/IT Pro 向けイベント \- Microsoft Events &amp; Seminars](https://www.microsoft.com/ja-jp/events/decode/2017/overview.aspx)

---

## Keynote

**The New Age of Intelligence** というタイトルで<br>
AI を中心に最新のテクノロジーについて紹介しています。

[de:code 2017 Keynote \(日本語\) \| de:code 2017 \| Channel 9](https://channel9.msdn.com/Events/de-code/2017/keynote-jp)

### Intelligent Cloud & Intelligent Edge

今での「Mobile First」、「Cloud First」というコンセプトから<br>
「Intelligent Cloud & Intelligent Edge」へ。

> Mobile だけでなく IoT や HoloLens などの「Intelligent Edge」からデータを収集、<br>
> 「Intelligent Cloud」でデータを分析・学習した結果を「Intelligent Edge」に展開して<br>
> 「Intelligent Edge」単体でリアルタイムに AI を活用可能とする。<br>
> **「Intelligent Cloud」のパワーを「Intelligent Edge」に展開する。**<br>

というのが「Intelligent Cloud & Intelligent Edge」のビジョンです。

[Intelligent Edge \| Microsoft](https://www.microsoft.com/en-us/internet-of-things/intelligentedge)

---

## Keynote Overview

- [Cognitive Services](https://azure.microsoft.com/ja-jp/services/cognitive-services/)
- [Microsoft Bot Framework](https://dev.botframework.com/)
- [Preferred Networks との協業](https://www.preferred-networks.jp/ja/news/pr20170523)
- Microsoft Office での AI 活用
- Microsoft PowerBI での AI 活用
- Intelligent DB: [SQL Server 2017](http://www.publickey1.jp/blog/17/sql_serversql_server_2017dbmstensorflowcntk.html)
	- 統合された R と Python でストアドプロシージャに AI の組み込み
	- Graph モデルのサポートによるより複雑な関係を分析
	- Adaptive Query Processing: クエリ処理の自動最適化
- Intelligent Lake: Azure Data Lake
	- Big Cognition: ペタバイト級のデータを利用可能な Cognitive 機能
	- コンテンツ(images, videos, spech, text, etc.) と構造化データを横断したクエリ
- Deep Intelligence: Azure Data Science Virtual Machine
	- データ分析や機械学習のためのツールをプリインストールしたAzureの仮想マシンイメージ
- Windows 10 Fall Creators Update
	- 「全製品、全サービスにインテリジェンスを組み込む」
- HoloLens: MR とコンピューティングの未来

---

## AI(Artifical Intelligence): 人工知能

### AI とは

コンピューター上で人間の知能を模倣したもの。

コンピュータがデータから傾向や法則性を導き出し、アルゴリズムを発展させ、<br>
新たなデータに対してアルゴリズムを用いて推測される答えを返答する。<br>

### AI を支える主な技術

Machine Learning: 機械学習

---

## Machine Learning

.fullwidth[![機械学習 とは](/images/microsoft-decode-2017/About_Machine_Learning_1.png)]

#### References
[AI を手軽に使える時代がやってきた！”人工知能パーツ” Cognitive Services 入門](https://doc.co/xrCf79)

---

## Machine Learning

.fullwidth[![機械学習でできること](/images/microsoft-decode-2017/About_Machine_Learning_2.png)]

#### References
[AI を手軽に使える時代がやってきた！”人工知能パーツ” Cognitive Services 入門](https://doc.co/xrCf79)

---

## Machine Learning

.fullwidth[![機械学習の利用例](/images/microsoft-decode-2017/About_Machine_Learning_3.png)]

#### References
[AI を手軽に使える時代がやってきた！”人工知能パーツ” Cognitive Services 入門](https://doc.co/xrCf79)

---

## Machine Learning

### プログラムと機械学習の違い

<br>
#### プログラム

Input に対してアルゴリズムを適用して Output を得る。

- アルゴリズムは固定

<br>
#### 機械学習

Input と Output から傾向や法則性を導き出し、より良いアルゴリズムを得る。<br>
得たアルゴリズムを用いて新たな Input から Output を推測する。

- 反復的に推測した Output を評価することで、アルゴリズムは変化する

---

## 機械学習の基礎知識

### 用語

- モデル：Input に対してアルゴリズムを適用して Output を返すもの
- 学習：データを投入してモデルの精度を上げること
- 評価：推測した Output と結果を比較してモデルの精度を検証すること

### 流れ

1. 目的・目標の設定
2. データの用意
3. データの前処理
4. モデルの設定
5. 学習
6. 評価
7. 2-6 の繰り返し

---

## 機械学習で考慮すべきこと
### 目的・目標の設定
- 本当に機械学習が必要なのか。
- どんなことを機械学習にやらせようとしているのか。
- どの程度の精度が担保できれば実用に耐えうるのか。

### データの用意・前処理
- データはあるのか、自社で用意できるのか、購入するのか。
- データがあっても機械学習に投入できるのか、<br>できなければ投入できる形式に収集・加工が必要。

 **最も重要で機械学習の9割を占めるとも。**

### モデルの設定
- 何を Input に 何を Output するのか。
- どんなアルゴリズムを使用するのか。

[Machine learning algorithm cheat sheet \| Microsoft Docs](https://docs.microsoft.com/en-us/azure/machine-learning/machine-learning-algorithm-cheat-sheet)

---

## Microsoft Congnitive Services

.fullwidth[![Microsoft Congnitive Services とは](/images/microsoft-decode-2017/About_Microsoft_Cognitive_Services_1.png)]

#### References
[AI × 導入の速さを武器に。”人工知能パーツ” Cognitive Services の使いどころ \| de:code 2017 \| Channel 9](https://channel9.msdn.com/Events/de-code/2017/AI03)

---

## Microsoft Congnitive Services

.fullwidth[![Microsoft Congnitive Services とは](/images/microsoft-decode-2017/About_Microsoft_Cognitive_Services_2.png)]

#### References
[AI × 導入の速さを武器に。”人工知能パーツ” Cognitive Services の使いどころ \| de:code 2017 \| Channel 9](https://channel9.msdn.com/Events/de-code/2017/AI03)

---

## Microsoft Congnitive Services

.fullwidth[![Microsoft Congnitive Services とは](/images/microsoft-decode-2017/About_Microsoft_Cognitive_Services_3.png)]

#### References
[AI × 導入の速さを武器に。”人工知能パーツ” Cognitive Services の使いどころ \| de:code 2017 \| Channel 9](https://channel9.msdn.com/Events/de-code/2017/AI03)

---

## Microsoft Congnitive Services

.fullwidth[![Microsoft Congnitive Services 一覧](/images/microsoft-decode-2017/Microsoft_Cognitive_Services_Overview.png)]

#### References
[AI × 導入の速さを武器に。”人工知能パーツ” Cognitive Services の使いどころ \| de:code 2017 \| Channel 9](https://channel9.msdn.com/Events/de-code/2017/AI03)

---

## Microsoft Congnitive Services

.fullwidth[![Microsoft Congnitive Services 概要](/images/microsoft-decode-2017/Microsoft_Cognitive_Services_Overview_1.png)]

#### References
[AI × 導入の速さを武器に。”人工知能パーツ” Cognitive Services の使いどころ \| de:code 2017 \| Channel 9](https://channel9.msdn.com/Events/de-code/2017/AI03)

---

## Microsoft Congnitive Services

.fullwidth[![Microsoft Congnitive Services 概要](/images/microsoft-decode-2017/Microsoft_Cognitive_Services_Overview_2.png)]

#### References
[AI × 導入の速さを武器に。”人工知能パーツ” Cognitive Services の使いどころ \| de:code 2017 \| Channel 9](https://channel9.msdn.com/Events/de-code/2017/AI03)

---

## Microsoft Congnitive Services

.fullwidth[![Microsoft Congnitive Services 概要](/images/microsoft-decode-2017/Microsoft_Cognitive_Services_Overview_3.png)]

#### References
[AI × 導入の速さを武器に。”人工知能パーツ” Cognitive Services の使いどころ \| de:code 2017 \| Channel 9](https://channel9.msdn.com/Events/de-code/2017/AI03)

---

## Microsoft Congnitive Services

.fullwidth[![Microsoft Congnitive Services 概要](/images/microsoft-decode-2017/Microsoft_Cognitive_Services_Overview_4.png)]

#### References
[AI × 導入の速さを武器に。”人工知能パーツ” Cognitive Services の使いどころ \| de:code 2017 \| Channel 9](https://channel9.msdn.com/Events/de-code/2017/AI03)

---

## Microsoft Congnitive Services

.fullwidth[![Microsoft Congnitive Services 概要](/images/microsoft-decode-2017/Microsoft_Cognitive_Services_Overview_5.png)]

#### References
[AI × 導入の速さを武器に。”人工知能パーツ” Cognitive Services の使いどころ \| de:code 2017 \| Channel 9](https://channel9.msdn.com/Events/de-code/2017/AI03)


---

## 個人的に面白かったセッション

- [AI × 導入の速さを武器に。”人工知能パーツ” Cognitive Services の使いどころ \| de:code 2017 \| Channel 9](https://channel9.msdn.com/Events/de-code/2017/AI03)

AI とは？というところから<br>
Cognitive Services の活用事例でどんなことができるか把握できる。

- [いまさら聞けない、エンジニアのための機械学習のキホン \| de:code 2017 \| Channel 9](https://channel9.msdn.com/Events/de-code/2017/AI01)

AI やっていきたいけど機械学習は全然わかりませんという人向け。<br>
基本的な知識が得られる。話がうまい。おもしろい。

- [50 分でわかるテスト駆動開発 \| de:code 2017 \| Channel 9](https://channel9.msdn.com/Events/de-code/2017/DO03)

デモがわかりやすく、テスト駆動開発について学べる。<br>
テスト駆動開発をしなくてもテストコードの書き方は参考になる。
