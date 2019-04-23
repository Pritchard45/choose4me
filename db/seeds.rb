require 'faker'

# default categories
5.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end
users = User.all

1.times do
  User.create!(
    email: "zander.pritchard@gmail.com",
    password: "helloworld"
  )
end

1.times do
  Category.create!(
    title: "Food",
    user: users.sample
  )
end

1.times do
  Category.create!(
    title: "Outdoor Activites",
    user: users.sample
  )
end

1.times do
  Category.create!(
    title: "Indoor Activites",
    user: users.sample
  )
end

1.times do
  Category.create!(
    title: "Movies",
    user: users.sample
  )
end

categories = Category.all

10.times do
  option = Option.create!(
    category: Category.find_by_title("Food"),
    title: Faker::Restaurant.unique.type,
    body: Faker::Restaurant.description,
    website: Faker::Internet.domain_name
  )

  option.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  rand(1..5).times { option.votes.create!(value: [-1, 1].sample, user: users.sample) }
end

10.times do
  option = Option.create!(
    category: Category.find_by_title("Outdoor Activites"),
    title: Faker::WorldCup.unique.team,
    body: Faker::WorldCup.city,
    website: Faker::Internet.domain_name
  )

  option.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  rand(1..5).times { option.votes.create!(value: [-1, 1].sample, user: users.sample) }
end

10.times do
  option = Option.create!(
    category: Category.find_by_title("Indoor Activites"),
    title: Faker::Vehicle.manufacture,
    body: Faker::Vehicle.model,
    website: Faker::Internet.domain_name
  )

  option.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  rand(1..5).times { option.votes.create!(value: [-1, 1].sample, user: users.sample) }
end

10.times do
  option = Option.create!(
    category: Category.find_by_title("Movies"),
    title: Faker::Movies::StarWars.planet,
    body: Faker::Movies::StarWars.quote,
    website: Faker::Internet.domain_name
  )

  option.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  rand(1..5).times { option.votes.create!(value: [-1, 1].sample, user: users.sample) }
end

puts "Seeds Finished"
puts "#{User.count} users created"
puts "#{Option.count} options created"
puts "#{Category.count} categories created"
puts "#{Vote.count} votes created"
