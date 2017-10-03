require 'random_data'

5.times do
  User.create!(
  email:    RandomData.random_email,
  password: RandomData.random_sentence
  )
end
users = User.all

15.times do
  Wiki.create!(
  user: users.sample,
  title: RandomData.random_sentence,
  body: random_paragraph
  )
end
wikis = Wiki.all


puts "Seed Finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
