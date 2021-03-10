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
      start_year: 2000,
      start_month: 1
    },
    {
      account_name: "Sara",
      email: "sara@email.com",
      password: "123456",
      first_name: "Sara",
      last_name: "Anderson",
      sex: 2,
      profile_image: open("./app/assets/images/sample_user/sample_user_2.jpg"),
      introduction: "よろしくお願いします。",
      prefecture: rand(1..47),
      start_year: 2000,
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
      start_year: 2000,
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
      start_year: 2000,
      start_month: 1
    }
  ]
)