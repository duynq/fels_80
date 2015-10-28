# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name: "quang duy",
             email: "quangduyx188@gmail.com",
             password: "123456",
             admin: true)
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password: password)
end
Category.create!(name: "Basic 500",
                 description: "afadsfasdfa fewrcescfadfcadxad",
                 created_at: Time.zone.now)
10.times do |n|
  name = Faker::Name.first_name
  description = Faker::Lorem.sentence
  Category.create!(name: name,
                 description: description,
                 created_at: Time.zone.now)
end
Word.create!(name: "Hello",
             mean: "Xin chào",
             category_id: 1)
50.times do |n|
  name = Faker::Name.first_name
  mean = Faker::Name.last_name
  Word.create!(name: name,
             mean: mean,
             category_id: 1)
end
