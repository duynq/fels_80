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

50.times do |n|
  name = Faker::Name.first_name
  word = Word.create!(name: name,category_id: 1)
  word_id = word.id
  answer_correct = Faker::Lorem.word
  Answer.create!(content: answer_correct, is_correct: true, word_id: word_id)
  3.times do |t|
    answer_incorrect = Faker::Lorem.word
    Answer.create!(content: answer_incorrect, is_correct: false, word_id: word_id)
  end
end
