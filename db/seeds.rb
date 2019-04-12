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


puts "#{Category.count} categories created"
