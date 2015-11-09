# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name: "Quang Duy",
             email: "quangduyx188@gmail.com",
             password: "111111",
             admin: true)
User.create!(name: "Nguyen Duy",
             email: "nguyenduyx188@gmail.com",
             password: "111111")
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password: password)
end

10.times do |n|
  name = Faker::Name.first_name
  description = Faker::Lorem.sentence
  Category.create!(name: name,
                 description: description,
                 created_at: Time.zone.now)
end

30.times do |n|
  name = "Word_#{n}"
  Word.create!(name: name,
               category_id: 1,
               created_at: Time.zone.now,
               updated_at: Time.zone.now)

  4.times do |m|
    name = "Answer_#{m}"
    Answer.create!(content: name,
                   is_correct: m == 0 ? 1 : 0,
                   word_id: n,
                   created_at: Time.zone.now,
                   updated_at: Time.zone.now)
  end
end
