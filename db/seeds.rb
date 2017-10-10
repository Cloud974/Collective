require 'faker'

5.times do
  u = User.new(
  email:    Faker::Internet.unique.email,
  password: Faker::Internet.password,
  )
  u.save!(:validate => false)

end
users = User.all

15.times do
  Wiki.create!(
  user: users.sample,
  title: Faker::RickAndMorty.character,
  body: Faker::RickAndMorty.quote
  private: false
  )
end

5.times do
  Wiki.create!(
  user: users.sample,
  title: Faker::RickAndMorty.character,
  body: Faker::RickAndMorty.quote
  private: true
  )
end
wikis = Wiki.all


puts "Seed Finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
