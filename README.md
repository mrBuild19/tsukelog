# つけログ

## サイト概要
- おいしいつけ麺の投稿とレビューを行うサイトです。
- フォローすることで、最新の情報を知ることができます。
- 真のつけ麺好き同士が集い、繋がり、情報共有することができます。

### サイトテーマ
- 新たなつけ麺の発見。
- 真のつけ麺好き仲間が見つかる。

### テーマを選んだ理由
- ラーメン店の情報共有サイトは見たことがあるが、つけ麺を専門としたサイトはなかったため。
- つけ麺好き達が情報交換できる場所があれば面白いと思ったから。

### ターゲットユーザ
つけ麺が好きな人全員

### 主な利用シーン
- つけ麺の記事投稿やレビューを投稿することができる。
- 気になる投稿にはコメントでコミュニケーションを図り、情報共有を行う。
- 自分がフォローしているユーザーの投稿がタイムライン形式で表示されるので、常に最新の情報を手に入れることができる。

## URL
https://tsukelog.work
- テストユーザー
  - メールアドレス： testuser@gmail.com
  - パスワード： testuser

## 言語・使用技術
- フロントエンド
  - HTML
  - Sass
  - Bootstrap4
  - JavaScript
  - jQuery
- サーバサイド
  - Ruby 2.5.7
  - Ruby on Rails 5.2.4.3
- DB
  - MySQL 5.7.22
- インフラ・開発環境等
  - AWS(VPC, EC2, RDS, Route53, ACM, ALB)
  - Git, GitHub

## 実装機能
- ユーザー機能
  - deviseを使用
  - 新規登録・ログイン・ログアウト機能
  - アカウントロック機能・セッションタイムアウト機能
  - マイページ・登録情報編集機能
- 管理者機能
- 記事投稿機能
  - 新規投稿・投稿詳細・投稿編集・削除機能
  - タイムライン機能
  - ソート機能(新着順といいねの多い順)
  - レビュー機能
- 画像の投稿機能
  - 画像プレビュー機能(投稿画像、プロフィール画像)
  - 複数枚画像投稿機能(投稿画像)
  - 画像スライド機能
- いいね、フォロー、コメント機能(Ajax)
- 無限スクロール機能(kaminari, infinite-scroll)
- 検索機能(投稿・ユーザー)
- タグ機能(タグ付け・タグによる絞り込み機能)

## 設計書
- WBS
  - https://docs.google.com/spreadsheets/d/1oEjWowxaD3P-YHIjm9f-07QUaVsOr9JGKVei-0qPmZI/edit#gid=977420151
- ER図
  - https://drive.google.com/file/d/1-y_ygBNCyokbqHa57_0u0DJ7XCQmv1Uf/view?usp=sharing
- ワイヤフレーム
  - https://drive.google.com/file/d/15jO0eCRYkS1tfds-iSgeHsBPcoHRJM-m/view?usp=sharing
- アプリケーション詳細設計書
  - https://drive.google.com/file/d/1I7d70L-ojFS4-WMrerJc0RCX2BlJYH3f/view?usp=sharing

### 機能一覧
https://docs.google.com/spreadsheets/d/1fZPCcORw_R6TglglHcL1YGHa30Yy2H-cwxbZXJY4m1M/edit#gid=0
