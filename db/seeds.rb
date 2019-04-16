require 'faker'

# default categories

1.times do
  Category.create!(
    title: "Food"
  )
end

1.times do
  Category.create!(
    title: "Outdoor Activites"
  )
end

1.times do
  Category.create!(
    title: "Indoor Activites"
  )
end

1.times do
  Category.create!(
    title: "Movies"
  )
end

categories = Category.all

50.times do
  Option.create!(
    category: categories.sample,
    title: Faker::Appliance.brand,
    body: Faker::Alphanumeric.alpha(10),
    website: Faker::Internet.domain_name
  )
end

puts "Seeds Finished"
puts "#{Option.count} options created"
puts "#{Category.count} categories created"
