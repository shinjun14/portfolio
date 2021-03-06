# seeking

## サイト概要
ゲーム、漫画、スポーツなどいろんな趣味の文化に触れ合うとことができます。さらに自分自身で評価し、実際に自分の趣味などをも紹介することもできます。

### サイトテーマ
多ジャンルの作品について投稿、評価、感想などを述べることができるサイトです。

### テーマを選んだ理由
観たい映画、読みたい漫画、遊びたいゲームなどで悩んだりすることが多くいろんなサイトを
見るんですがほとんどがサイト主による感想や評価がほとんどです。いろんなユーザーが評価をし議論や良いところや悪いところを評価するサイトを作りたいと思いました。
さらに自分で趣味を紹介し、趣味の文化を知ってもらうことで人口が増え経済的にも役立つと思いテーマを選びました。
自分でもおすすめ映画やゲームなどを検索するんですが正直どれも似たような結果になっています。そのため結局どれも観たことがる、遊んだことがるような結果になって
しまい結局何も見つけることができないことが多いです。なのでユーザーの数だけ紹介できる部分は自分に合った作品を見つけることができると思います。

### ターゲットユーザ
暇な時間に何か読みたい、何か観たい、何かゲームをしたいけど何が良いかわからないなどで悩んでいる人など

### 主な利用シーン
趣味を持ちたいけど、どういう趣味がいいか悩んだ時など。
そして同じ趣味を持っている人と交流を深めたい時など。

## 設計書
https://app.diagrams.net/#G12Q63H__kqvLqdZJg4QXxzAB7gan1C8wV>
https://docs.google.com/spreadsheets/d/1FejGusucitBQ79yaEh4rMwr9wVufX3p22RkqDCfqprQ/edit#gid=735042613

## チャレンジ要素一覧
https://docs.google.com/spreadsheets/d/1I4dl7CUFUU8i7JV-iySt2HL7M0jE_pDaKgjO4-Z1fp8/edit#gid=0

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
https://pixabay.com/ja/   （画像）
https://www.photo-ac.com/　　（画像）

<div class="col mt-3">
  <%= render 'layouts/form', hobby: @hobby, user: @user %>
</div>