# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




User.create!(
  [
    {
      account_name: "John",
      email: "john@email.com",
      password: "123456",
      first_name: "Adams",
      last_name: "John",
      sex: 1,
      profile_image: open("./app/assets/images/sample_user/sample_user_1.jpg"),
      introduction: "John Adamsです。",
      prefecture: rand(1..47),
      start_year: rand(2010..2020),
      start_month: rand(1..12),
      teens: "10代",
    },
    {
      account_name: "Sara",
      email: "sara@email.com",
      password: "123456",
      first_name: "Anderson",
      last_name: "Sara",
      sex: 2,
      profile_image: open("./app/assets/images/sample_user/sample_user_2.jpg"),
      introduction: "よろしくお願いします。",
      prefecture: rand(1..47),
      start_year: rand(2010..2020),
      start_month: rand(1..12),
      teens: "20代",
    },
    {
      account_name: "Tom",
      email: "Tom@email.com",
      password: "123456",
      first_name: "Cooper",
      last_name: "Tom",
      sex: 1,
      profile_image: open("./app/assets/images/sample_user/sample_user_3.jpg"),
      introduction: "よろしくお願いします。",
      prefecture: rand(1..47),
      start_year: rand(2010..2020),
      start_month: rand(1..12),
      teens: "30代",
    },
    {
      account_name: "Tomas",
      email: "Tomas@email.com",
      password: "123456",
      first_name: "Brown ",
      last_name: "Tomas",
      sex: 1,
      profile_image: open("./app/assets/images/sample_user/sample_user_4.jpg"),
      introduction: "よろしくお願いします。",
      prefecture: rand(1..47),
      start_year: rand(2010..2020),
      start_month: rand(1..12),
      teens: "20代",
    }
  ]
)

User.find(1).posts.create!(
  [
    {
      body: "初ラウンド。景色もよく最高でした。",
      post_image: open("./app/assets/images/sample_post/sample_post_1.jpg"),
    },
    {
      body: "あのウッズさんにレッスンしてもらいました",
      post_image: open("./app/assets/images/sample_post/sample_post_2.jpg"),
    },
  ]
)

User.find(2).posts.create!(
  [
    {
      body: "パター新調しました。",
      post_image: open("./app/assets/images/sample_post/sample_post_3.jpg"),
    },
    {
      body: "本日の練習はゴルフ場で",
      post_image: open("./app/assets/images/sample_post/sample_post_4.jpg"),
    },
  ]
)

User.find(3).posts.create!(
  [
    {
      body: "雨スタートでも、天気がよくなりました。",
      post_image: open("./app/assets/images/sample_post/sample_post_5.jpg"),
    },
    {
      body: "バンカーショットが難しい↓↓↓",
      post_image: open("./app/assets/images/sample_post/sample_post_6.jpg"),
    },
  ]
)

User.find(4).posts.create!(
  [
    {
      body: "ダフらないコツは前傾です。",
      post_image: open("./app/assets/images/sample_post/sample_post_7.jpg"),
    },
    {
      body: "バンカーのコツはフェースを開くこと。ハンドファーストに構えると砂に刺さります。",
      post_image: open("./app/assets/images/sample_post/sample_post_8.jpg"),
    },
  ]
)

