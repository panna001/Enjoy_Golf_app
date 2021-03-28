# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# ラウンド用
place_a = [
  "パインレークCC",
  "ロータリーゴルフクラブ",
  "かずさCC",
  "千葉新日本CC",
  "山の原GC",
  "大津CC",
  "鈴鹿CC",
  "水戸GC",
  "奈良名阪GC",
  "沼津国際CC",
  "桑名国際ゴルフCC",
  "ラ・ヴィスタゴルフリゾート",
  "名阪チサンCC",
  "大多喜CC"
]

weather_a = [
  "晴れ",
  "くもり",
  "雨",
  "雪"
]

wind_a = [
  "無風",
  "微風",
  "強風"
]

stroke_count_s = 60..72
stroke_count_a1 = 72..81
stroke_count_a2 = 81..90
stroke_count_b1 = 90..99
stroke_count_b2 = 99..108
stroke_count_c1 = 108..117
stroke_count_c2 = 117..126
stroke_count_d1 = 126..135
stroke_count_d2 = 135..144
stroke_count_e = 144..153

putt_count_s = 20..25
putt_count_a1 = 24..29
putt_count_a2 = 25..33
putt_count_b1 = 29..37
putt_count_b2 = 33..41
putt_count_c1 = 37..45
putt_count_c2 = 41..49
putt_count_d1 = 45..53
putt_count_d2 = 49..57
putt_count_e = 53..61

par_on_count_a = 13..16
par_on_count_b = 10..13
par_on_count_c = 7..10
par_on_count_d = 4..7
par_on_count_e = 1..4

fairway_count_a = 13..16
fairway_count_b = 10..13
fairway_count_c = 7..10
fairway_count_d = 4..7
fairway_count_e = 1..4

ob_count_a = 0..1
ob_count_b = 0..2
ob_count_c = 0..3
ob_count_d = 0..4
ob_count_e = 0..5

penalty_count_a = 0..1
penalty_count_b = 0..2
penalty_count_c = 0..3
penalty_count_d = 0..4
penalty_count_e = 0..5

# ラウンド日
from = Time.parse("2018/01/01")
to = Time.parse("2021/03/28")




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
      rank: "AA",
      average: stroke_count_s
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
      rank: "A+",
      average: stroke_count_a1
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
      rank: "A-",
      average: stroke_count_a2
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
      rank: "B+",
      average: stroke_count_b1
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

