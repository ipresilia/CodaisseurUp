# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Profile.destroy_all
Rsvp.destroy_all
Theme.destroy_all
Event.destroy_all
User.destroy_all


# Themes
black_and_white = Theme.create!(name: "Black and White")
vintage = Theme.create!(name: "Vintage")
modern = Theme.create!(name: "Modern")
game_day = Theme.create!(name: "Game Day")
comedy = Theme.create!(name: "Comedy")
coding = Theme.create!(name: "Coding")
workshop = Theme.create!(name: "Workshop")
cycling = Theme.create!(name: "Cycling")
tour = Theme.create!(name: "Tour")


# Users
john = User.create!(email: "john@codaisseurup.com", password: "abcd1234")
iko = User.create!(email: "iko@codaisseurup.com", password: "abcd1234")
smith = User.create!(email: "smith@codaisseurup.com", password: "abcd1234")
puts "Created user"


# Events
event1 = Event.create!(name: "Coding LOLz", description: "A comedy night for coders.", location: "The Hague", price: 0.0, capacity: 50, includes_food: true, includes_drinks: true, starts_at: 10.days.from_now, ends_at: 11.days.from_now, active: true, user: john, themes: [comedy, coding])
event2 = Event.create!(name: "Games, Games, Games", description: "A whole day to play games of all types", location: "Amsterdam", price: 0.0, capacity: 50, includes_food: true, includes_drinks: true, starts_at: 30.days.from_now, ends_at: 31.days.from_now, active: true, user: iko, themes: [game_day])
event3 = Event.create!(name: "Do the flower thing", description: "A day where we cycle to view the beautiful flowers of the Netherlands", location: "The Hague", price: 0.0, capacity: 10, includes_food: false, includes_drinks: false, starts_at: 2.days.from_now, ends_at: 3.days.from_now, active: true, user: smith, themes: [cycling, tour])


# rsvps
Rsvp.create(event: event1, user: john, price: 0.0, total: 50, starts_at: 10.days.from_now, ends_at: 11.days.from_now)
Rsvp.create(event: event2, user: iko, price: 0.0, total: 50, starts_at: 30.days.from_now, ends_at: 31.days.from_now)
Rsvp.create(event: event3, user: smith, price: 0.0, total: 10, starts_at: 2.days.from_now, ends_at: 3.days.from_now)
