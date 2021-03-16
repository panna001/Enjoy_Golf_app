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
      start_year: "2000/01/01",
      start_month: 1
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
      start_year: "2000/01/01",
      start_month: 1
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
      start_year: "2000/01/01",
      start_month: 1
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
      start_year: "2003/01/01",
      start_month: 1
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

User.find(1).rounds.create!(
  [
    {
      play_date: "2020/10/01",
      place: "ローズウッド",
      weather: "くもり",
      wind: "無風"
    },
    {
      play_date: "2020/10/02",
      place: "阪奈CC",
      weather: "晴れ",
      wind: "強風"
    }
  ]
)

User.find(2).rounds.create!(
  [
    {
      play_date: "2020/11/01",
      place: "白鵬CC",
      weather: "雨",
      wind: "弱風"
    },
    {
      play_date: "2020/11/02",
      place: "高槻CC",
      weather: "晴れ",
      wind: "無風"
    }
  ]
)

User.find(3).rounds.create!(
  [
    {
      play_date: "2020/12/01",
      place: "東條CC",
      weather: "くもり",
      wind: "強風"
    },
    {
      play_date: "2020/12/02",
      place: "阪奈CC",
      weather: "雪",
      wind: "強風"
    }
  ]
)

User.find(4).rounds.create!(
  [
    {
      play_date: "2021/01/01",
      place: "パインレークCC",
      weather: "晴れ",
      wind: "無風"
    },
    {
      play_date: "2020/01/02",
      place: "東大阪CC",
      weather: "晴れ",
      wind: "弱風"
    }
  ]
)

8.times do |n|
  18.times do |i|
    Round.find(n + 1).scores.create!(
      hole_number: i + 1,
      par_count: rand(3..5),
      stroke_count: rand(3..7),
      putt_count: rand(0..2),
      fairway_keep: rand(0..1),
      ob_count: rand(0..1),
      penalty_count: rand(0..1)
    )
  end
end
