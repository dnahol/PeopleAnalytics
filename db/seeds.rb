# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Faker::UniqueGenerator.clear

House.destroy_all
BannerPerson.destroy_all
Membership.destroy_all
LoyaltyPoint.destroy_all
Advisement.destroy_all
Handout.destroy_all

houses = []
4.times do |index|
  hname =
  Faker::Creature::Animal.unique.name
  house =
  House.create!(
    name: hname,
    loyalty_range: [Faker::Number.within(9..11), Faker::Number.within(12..18)],
    image: Faker::LoremFlickr.image("200x100", ["#{hname}?lock=#{index}"])
  )
  houses << house
end
# p "Created #{House.count} Houses"

100.times do |index|
  Faker::Date.unique.clear
  bannerPerson =
  BannerPerson.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    image: Faker::LoremFlickr.image("100x100", ["person,portrait/all?lock=#{index}"])
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
  advisement = nil
  upper = membership.house.loyalty_range[1]
  lower = membership.house.loyalty_range[0]
  mid = (upper - lower) / 2
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

    loyaltyNeed =
      loyaltyPoint.pts < lower ? 1 :
      loyaltyPoint.pts > upper ? -1 : 0

    diff = mid - loyaltyPoint.pts
    if adLast == false
      units = 100 *
      ( (200 - 2) / 2  + diff *
      (loyaltyNeed == 0 ? 1 :
        loyaltyNeed == 1 ? 2 :
        loyaltyNeed == -1 ? 0.5 : nil ) )
      advisement =
      Advisement.create!(
        date: Faker::Date.between(loyaltyPoint.date, "#{ending}"),
        units: units,
        membership: membership
      )
      adLast = true
    else
      adLast = false
    end

    hFreq = Faker::Number.between(2,3)
    i = 0
    firstDate = Date.parse(start.to_s)
    until i == hFreq || firstDate > Date.parse(ending.to_s) do
      match = Faker::Coin.flip == "Heads"
      range =
        loyaltyNeed == 0 ? [50, 150] :
        loyaltyNeed == 1 ? [151, 200] :
        loyaltyNeed == -1 ? [2, 149] : nil
      huts = match ? advisement.units : 100 * Faker::Number.between(range[0], range[1])
      handout =
      Handout.create!(
        date: Faker::Date.unique.between(firstDate, "#{ending}"),
        units: huts,
        membership: membership
      )
      i += 1
      firstDate = handout.date + 1.day
    end

    start = ending + 1
  end
end
p "Created BannerPersons, assigned Houses, Created LoyaltyPoints, Handouts,"
p " and Advisements for Jan 2019"
