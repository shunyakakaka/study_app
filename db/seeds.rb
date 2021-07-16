# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env == 'development'
  30.times do |i|
    i += 1
    User.create(name: "ユーザー#{i}", job: "ニート", description: "おいらたちはニートだよ",password: "password")
  end

  30.times do |i|
    i += 1
    Record.create(time: i + 100, total_time: i + 100, task_kind: "#{i}", user_id: "#{i}")
  end
end