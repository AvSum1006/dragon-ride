require 'faker'
require "open-uri"

Booking.destroy_all
Dragon.destroy_all
User.destroy_all

puts 'Creating user1 without dragons...'

user1 = User.new(
  username: 'user1',
  email: 'user1@test.com',
  password: 'password'
)
file = URI.open("https://images.unsplash.com/photo-1618329075618-0d0c6ee9807b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGtuaWdodHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=800&q=60")
user1.image.attach(io: file, filename: "avatar-gimli.jpg", content_type: "image/jpeg")
user1.save!

puts 'Creating user2 with one dragon...'

user2 = User.new(
  username: 'user2',
  email: 'user2@test.com',
  password: 'password'
)
file = URI.open("https://images.unsplash.com/photo-1606773061828-28a5ad536bf8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8a25pZ2h0fGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60")
user2.image.attach(io: file, filename: "avatar-legolas.jpg", content_type: "image/jpeg")
user2.save!

dragon = Dragon.new(
  name: Faker::Movies::HowToTrainYourDragon.dragon,
  location: Faker::Address.city,
  category: Dragon::CATEGORY.sample,
  price_per_day: rand(200..1200),
  description: "This dragon's metallic scales are the color of an overcast sky. It has an elegant, long body. This dragon has short, thin limbs with four digits on each foot that end in sharp claws. It has large, wide-set wings. This dragon has a mouth that takes up most of its face. It has giant oval nostrils located unusually far back on its snout. This dragon has narrow eyes that are the color of valuable emeralds. A single horn projects from the base of its chin. Flaps of skin allow it to completely close its nostrils.",
  seats: rand(1..8),
  age: rand(10..1000)
)
dragon.user = user2
file = URI.open("https://images.unsplash.com/photo-1608133012729-7c76e221449c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8ZHJhZ29uc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=800&q=60")
dragon.image.attach(io: file, filename: "dragon1.jpg", content_type: "image/jpeg")
dragon.save

puts 'Creating user3 with many dragons...'

user3 = User.new(
  username: 'user3',
  email: 'user3@test.com',
  password: 'password'
)
file = URI.open("https://images.unsplash.com/photo-1600081522768-cb2e80ed4491?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8a25pZ2h0fGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60")
user3.image.attach(io: file, filename: "avatar-aragorn.jpg", content_type: "image/jpeg")
user3.save!

dragon = Dragon.new(
  name: Faker::Movies::HowToTrainYourDragon.dragon,
  location: Faker::Address.city,
  category: Dragon::CATEGORY.sample,
  price_per_day: rand(200..1200),
  description: "This dragon's scales are white, and it has a turtle-like shell on its back. It has a serpentine, short body with a very long, slender neck. This dragon has thin limbs with three closely-mounted digits on each foot. It has small wings running from its shoulders to its hips. This dragon's head is bluntly-formed. It has small eyes that are the color of burning flames. The back of this dragon's head and neck is protected by thick bone. Bony knobs surround its nostrils.",
  seats: rand(1..8),
  age: rand(10..1000)
)
dragon.user = user3
file = URI.open("https://images.unsplash.com/photo-1548412576-d92cb3275e23?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2948&q=80")
dragon.image.attach(io: file, filename: "dragon2.jpg", content_type: "image/jpeg")
dragon.save

dragon = Dragon.new(
  name: Faker::Movies::HowToTrainYourDragon.dragon,
  location: Faker::Address.city,
  category: Dragon::CATEGORY.sample,
  price_per_day: rand(200..1200),
  description: "This dragon has a broad body with a long, wide tail. Its scales are purple, and it has a turtle-like shell on its back. On the end of its tail is a long spike. This dragon has thick limbs with four digits on each foot that end in long claws. It has wide-set wings. This dragon's head is wedge-shaped. It has slitted eyes that are bronze. This dragon has huge, frilled ears. The back of this dragon's head and neck is protected by thick bone. Spiky, bony knobs surround its mouth.",
  seats: rand(1..8),
  age: rand(10..1000)
)
dragon.user = user3
file = URI.open("https://images.unsplash.com/photo-1514922121266-75835418bbf1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGRyYWdvbnN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60")
dragon.image.attach(io: file, filename: "dragon3.jpg", content_type: "image/jpeg")
dragon.save

dragon = Dragon.new(
  name: Faker::Movies::HowToTrainYourDragon.dragon,
  location: Faker::Address.city,
  category: Dragon::CATEGORY.sample,
  price_per_day: rand(200..1200),
  description: "This dragon's scaly skin is midnight black. It has a stocky body. This dragon has elongated, thick limbs with five digits on each foot that end in long, blunt claws. It has wide-set wings running from its shoulders to its hips. Two membranous frills run from the base of its skull, down its back, to the tip of its tail. This dragon's head is wide and it has a mouth that runs most of the length of its face and has a prounounced overbite. It has tiny nostrils located unusually far back on its snout. This dragon has droopy eyes that are apple-green. It has huge, pointed ears. A bony plate projects from the back of its skull, protecting its upper neck Bony knobs surround its nostrils. Two long, curly horns extend from its forhead.",
  seats: rand(1..8),
  age: rand(10..1000)
)
dragon.user = user3
file = URI.open("https://images.unsplash.com/photo-1599721765154-0f596e632cba?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2874&q=80")
dragon.image.attach(io: file, filename: "dragon4.jpg", content_type: "image/jpeg")
dragon.save

dragon = Dragon.new(
  name: Faker::Movies::HowToTrainYourDragon.dragon,
  location: Faker::Address.city,
  category: Dragon::CATEGORY.sample,
  price_per_day: rand(200..1200),
  description: "This dragon's plate-like, unreflective scales are brown, shading to lighter on its belly. It has a broad body with a very long, thick tail. This dragon has short, powerful limbs with six digits on each foot that end in short, blunt claws. It has wide-set, fanlike wings. This dragon has a small mouth. It has three almond-shaped gem-like eyes that are white. This dragon has small holes for ears. The back of this dragon's head and neck is protected by thick bone. Bladelike bony plates sprout from its chin. Two long, straight horns extend straight up from its forhead.",
  seats: rand(1..8),
  age: rand(10..1000)
)
dragon.user = user3
file = URI.open("https://images.unsplash.com/photo-1548957537-31e688cb23b2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1920&q=80")
dragon.image.attach(io: file, filename: "dragon5.jpg", content_type: "image/jpeg")
dragon.save

puts 'Creating bookings...'

5.times do
start_date = Date.new(2023, rand(1..12), rand(1..20))
duration = rand(1..10)
end_date = start_date + duration
user = [user1, user2].sample
dragon = Dragon.all.reject { |el| el.user_id == user.id }.sample

booking = Booking.new(
  start_date: start_date,
  end_date: end_date,
  duration: duration,
  status: Booking::STATUS.sample,
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
