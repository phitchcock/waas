# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

5.times do
  user = User.new(
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.save
end
users = User.all

50.times do 
  Wiki.create(
    title: Faker::Commerce.product_name,
    information: Faker::Lorem.paragraph
    )
end
wikis = Wiki.all

100.times do 
  Article.create(
    wiki: wikis.sample,
    information: Faker::Lorem.paragraph
    )
end
articles = Article.all

200.times do
  Comment.create(
    user: users.sample,
    article: articles.sample,
    info: Faker::Lorem.paragraph
    )
end

puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{Article.count} articles created"
puts "#{Comment.count} comments created"