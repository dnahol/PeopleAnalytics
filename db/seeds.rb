# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

House.destroy_all

4.times do |index|
  House.create!(
                name: Faker::Creature::Animal.name,
                loyalty_range: [Faker::Number.within(9..11), Faker::Number.within(12..18)]
              )

end

# House.create!([{
#   name: "Gryffindor",
#   loyalty_range: [10, 15]
# },
# {
#   name: "Slytherin",
#   loyalty_range: [15, 18]
# },
# {
#   name: "Hufflepuff",
#   loyalty_range: [9, 14]
# }])

p "Created #{House.count} Houses"


BannerPerson.destroy_all

100.times do |index|
  BannerPerson.create!(
                first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                image: Faker::LoremFlickr.image("100x100", ['person'])
              )
end

# BannerPerson.create!([{
#   first_name: "Pam",
#   last_name: "Smith",
#   image: '../app/assets/pm.jpg'
# },
# {
#   first_name: "Tom",
#   last_name: "Miller",
#   image: '../app/assets/tm.jpg'
# },
# {
#   first_name: "Sandra",
#   last_name: "Worthington",
#   image: '../app/assets/sw.jpg'
# }])

p "Created #{BannerPerson.count} BannerPersons"
