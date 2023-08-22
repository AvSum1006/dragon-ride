require 'faker'

def create_random_dragon(owner)
  dragon = Dragon.new(
    name: Faker::Movies::HowToTrainYourDragon.dragon,
    location: Faker::Fantasy::Tolkien.location,
    category: %w[Wyvern Wyrm Quetzalcoatl Hydra Drake].sample,
    user_id: owner,
    price_per_day: rand(200..1200),
    description: Faker::Lorem.paragraphs.join,
    seats: rand(1..8),
    age: rand(10..1000),
  )
  dragon.user = owner
  dragon.save!
end

puts 'Creating user1 without dragons...'

user = User.new(
  username: 'user1',
  email: 'user1@test.com',
  password: 'password',
)
user.save!

puts 'Creating user2 with one dragon...'

user = User.new(
  username: 'user2',
  email: 'user2@test.com',
  password: 'password',
)
user.save!
5.times do
  create_random_dragon(user)
end

puts 'Creating user3 with many dragons...'

user = User.new(
  username: 'user3',
  email: 'user3@test.com',
  password: 'password',
)
user.save!
5.times do
  rand(2..5).times do
    create_random_dragon(user)
  end
end

puts "#{User.all.length} users and #{Dragon.all.length} dragons have been created!"
