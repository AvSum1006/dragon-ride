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
  password: 'password'
)
user.save!
rand(2..5).times do
  create_random_dragon(user)
end

puts 'Creating bookings...'

20.times do
  start_date = Date.new(2023, rand(1..12), rand(1..20))
  duration = rand(1..10)
  end_date = start_date + duration
  user = User.all.sample
  dragon = Dragon.all.sample

  booking = Booking.new(
    start_date: start_date,
    end_date: end_date,
    duration: duration,
    status: %w(Pending Confirmed).sample,
    total_price: dragon.price_per_day * duration
  )
  booking.user = user
  booking.dragon = dragon
  booking.save!
end

puts 'Created:'
puts "#{User.all.length} users"
puts "#{Dragon.all.length} dragons"
puts "#{Booking.all.length} bookings"
