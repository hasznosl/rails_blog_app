# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


array = Array.new

100.times do
  hash = Hash.new
  hash[:title] = Faker::Name.title
  hash[:body] = Faker::Lorem.paragraphs(rand(5)+1).join(" ")
  hash[:user_id] = User.first
  array.push(hash)
end

posts = Post.create(array)
