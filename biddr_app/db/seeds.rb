# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
PASSWORD = 'supersecret'
Auction.destroy_all
Bid.destroy_all
User.destroy_all

10.times.each do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
      first_name: first_name,
      last_name: last_name,
      email: "o@o.o",
      password: PASSWORD
    )
end

users = User.all

10.times.each do
    title = Faker::Beer.name
    description = Faker::Beer.style
    endson = Faker::Business.credit_card_expiry_date
    Auction.create(
        title: title,
        description: description,
        endson: endson,
        price: rand(1..100),
        user: users.sample
    )
end

auctions = Auction.all

auctions.each do |auction|
    rand(0..7).times.each do
    bid = Bid.create(
        bid: rand(0..100),
        auction: auctions.sample,
        user: users.sample
        )
    end

end
bids = Bid.all
puts "#{auctions.count} auctions were created"
puts "#{bids.count} bids were created"
puts "#{users.count} users were created"
