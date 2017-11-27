json.auctions @auctions do |auction|
  json.id auction.id
  json.title auction.title
  json.price auction.price
  json.creation_date auction.created_at.strftime('%Y-%B-%d')
  json.user do
    json.first_namme auction.user.first_name
    json.last_namme auction.user.last_name
  end
end
