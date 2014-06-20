# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'faker'

# 5.times do
#   user = User.new(
#     email:    Faker::Internet.email,
#     password: Faker::Lorem.characters(10)
#   )
#   user.save
# end
# users = User.all

# 50.times do 
#   idea.create(
#     title: Faker::Commerce.product_name,
#     body: Faker::Lorem.paragraph
#     )
# end
# ideas = idea.all

# 100.times do 
#   screen.create(
#     idea: ideas.sample,
#     body: Faker::Lorem.paragraph
#     )
# end
# screens = screen.all

# 200.times do
#   Comment.create(
#     user: users.sample,
#     screen: screens.sample,
#     info: Faker::Lorem.paragraph
#     )
# end

# puts "Seed finished"
# puts "#{idea.count} ideas created"
# puts "#{screen.count} screens created"
# puts "#{Comment.count} comments created"