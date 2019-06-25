# Pro-chart

## Description
プログラミングをなにから学べばいいかわからないという問題を、他の人が学んできた歩みを参考にすることで解決するプロダクト

![Screenshot from 2019-06-25 12-14-21](https://user-images.githubusercontent.com/20394831/60070834-1f9d6800-9753-11e9-9eee-9c5d39a79e32.png)
![Screenshot from 2019-06-25 12-17-24](https://user-images.githubusercontent.com/20394831/60070838-24fab280-9753-11e9-8f2b-48c66079b23a.png)
![Screenshot from 2019-06-25 12-17-31](https://user-images.githubusercontent.com/20394831/60070846-2af09380-9753-11e9-9fd1-bc0610bfbee2.png)
![Screenshot from 2019-06-25 12-19-06](https://user-images.githubusercontent.com/20394831/60070848-2f1cb100-9753-11e9-8a67-5bc5b49eb7d2.png)
![Screenshot from 2019-06-25 12-17-10](https://user-images.githubusercontent.com/20394831/60070850-317f0b00-9753-11e9-9135-4efb0e07a2c3.png)


## Features
- ユーザー関連
  - 新規登録
  - ログイン
    - ログイン情報の保持
  - ログアウト
  - 管理者権限

- 言語・要素関連
  - 言語・要素登録
  - 要素詳細内での掲示板
  - 編集・削除（管理者のみ）
  - 自分が過去に達成したかわかる

- 日々の成果関連
  - 成果登録
  - 削除（当人・管理者のみ）
  
## Requirement
- Rails 5.2.3
- Ruby 2.6.3

## Usage
#### 成果の登録を行う場合
1. ユーザー登録・ログイン
2. トップから、「今日の成果」を選択
3. 日付・コメントと一緒に、習得した言語とその要素を選択する。（例： C言語のprintfなど）

#### 他人の学習状況を参考にする場合
- どんな言語・要素を学ぼうかな
  - 「みんなのタスク」から、人気のある言語を知る（人数順でソート）
- みんな最近何をしてるのかな
  - 「みんなの成果」から、他の人の成果を知る
- printfわからないよ〜、誰かに聞きたい！
  - 対象の要素詳細（C言語のprintfのページ）の、クリアした人一覧の中から聞きに行く。
  - 掲示板機能を使い、質問する。

## Installation
1. `git clone git@github.com:kyutech-programming-club/pro-chart.git`
2. `cd pro-chart`
3. `bundle install`
4. `rails db:migrate`
5. `rails s`
