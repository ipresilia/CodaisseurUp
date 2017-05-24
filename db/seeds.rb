# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Theme.destroy_all
User.destroy_all

black_and_white = Theme.create!(name: "Black and White")
vintage = Theme.create!(name: "Vintage")
modern = Theme.create!(name: "Modern")
game_day = Theme.create!(name: "Game Day")
comedy = Theme.create!(name: "Comedy")
coding = Theme.create!(name: "Coding")
workshop = Theme.create!(name: "Workshop")
cycling = Theme.create!(name: "Cycling")
tour = Theme.create!(name: "Tour")

john = User.create!(email: "john@codaisseurup.com", password: "abcd1234")
iko = User.create!(email: "iko@codaisseurup.com", password: "abcd1234")
smith = User.create!(email: "smith@codaisseurup.com", password: "abcd1234")
puts "Created user"

event = Event.create!(name: "Coding LOLz", description: "A comedy night for coders.", location: "The Hague", price: 0.0, capacity: 50, includes_food: true, includes_drinks: true, starts_at: 3.days.ago, ends_at: 2.days.ago, active: true, user: john)
event = Event.create!(name: "Games, Games, Games", description: "A whole day to play games of all types", location: "Amsterdam", price: 0.0, capacity: 50, includes_food: true, includes_drinks: true, starts_at: '2017-06-03', ends_at: '2017-6-4', active: true, user: iko)
event = Event.create!(name: "Do the flower thing", description: "A day where we cycle to view the beautiful flowers of the Netherlands", location: "The Hague", price: 0.0, capacity: 10, includes_food: false, includes_drinks: false, starts_at: '2017-5-25', ends_at: '2017-5-25', active: true, user: smith)
