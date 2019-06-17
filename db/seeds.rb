# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

House.destroy_all
BannerPerson.destroy_all
Membership.destroy_all
LoyaltyPoint.destroy_all
Advisement.destroy_all
Handout.destroy_all

houses = []
4.times do |index|
  house =
  House.create!(
    name: Faker::Creature::Animal.unique.name,
    loyalty_range: [Faker::Number.within(9..11), Faker::Number.within(12..18)]
  )
  houses << house
end
# p "Created #{House.count} Houses"

100.times do |index|
  bannerPerson =
  BannerPerson.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    image: Faker::LoremFlickr.image("100x100", ["person?#{index}"])
  )
  # p "Created BannerPeople"
  house = houses[index % 4]
  membership =
  Membership.create!(
    active: true,
    date_added: Faker::Date.between('20180101', '20181231'),
    hsid: "#{house.name[0]}-" + Faker::Alphanumeric.unique.alphanumeric(6),
    house: house,
    banner_person: bannerPerson
  )
  # p "Created 1 Membership"
  start = 20190101
  adLast = false
  5.times do |j|
    ending =  start + 6
    if ending > 20190131
      ending = 20190131
    end
    # p "Week start: #{start}, ending: #{ending}"
    loyaltyPoint =
    LoyaltyPoint.create!(
      date: Faker::Date.between("#{start}", "#{ending}"),
      pts: Faker::Number.between(5,18),
      membership: membership
    )
    # p "Created 1 LoyaltyPoint Measurement"

    hFreq = Faker::Number.between(2,3)
    hFreq.times do |k|
      Handout.create!(
        date: Faker::Date.between("#{start}", "#{ending}"),
        units: 100 * Faker::Number.between(2,200),
        membership: membership
      )
    end

    if adLast == false
      Advisement.create!(
        date: Faker::Date.between("#{start}", "#{ending}"),
        units: 100 * Faker::Number.between(2,200),
        membership: membership
      )
      adLast = true
    else
      adLast = false
    end
    start = ending + 1
  end
end
p "Created BannerPersons, assigned Houses, Created LoyaltyPoints, Handouts,"
p " and Advisements for Jan 2019"
