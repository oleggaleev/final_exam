require 'faraday'
require 'json'

BASE_URL = 'http://localhost:3000'
API_KEY = '6cYh3CVqEr0bSHJP0fqHuG_6ahoBGHMk43GWmWu0gKKX4BbAgO1c08CKEMnCseUKfLfnlDcLlA481FbCGr-ikA'

conn = Faraday.new url: BASE_URL

response = conn.get do |req|
  req.url '/api/v1/auctions'
  req.headers['API_KEY'] = API_KEY
end

data = JSON.parse(response.body)
data["auctions"].each do |auction|
  puts "#{auction['id']} - #{auction['title']}"
end

def update(conn)
  print 'Select a auction id:'
  id = gets.chomp
  print 'Enter a new title: '
  title = gets.chomp
  print 'Enter a new description: '
  description = gets.chomp

  params = { auction: { title: title, description: description } }

  response = conn.patch do |req|
    req.url "/api/v1/auctions/#{id}"
    req.headers['API_KEY'] = API_KEY
    req.params = params
  end
  data = JSON.parse(response.body)
  if data['errors']
    puts "Something went wrong: #{data['errors']}"
  else
    puts 'Update was successful'
  end
end

def destroy(conn)
  print 'Select a product id '
  id = gets.chomp

  response = conn.delete do |req|
    req.url "/api/v1/auctions/#{id}"
    req.headers['API_KEY'] = API_KEY
  end
  data = JSON.parse(response.body)
  if data['errors']
    puts "Error happend: #{data['errors']}"
  else
    puts 'Delete was successful'
  end

end

def show(conn)
  print 'Select a product id '
  id = gets.chomp

  response = conn.get do |req|
    req.url "/api/v1/auctions/#{id}"
    req.headers['API_KEY'] = API_KEY
  end

  data = JSON.parse(response.body)

  puts '>>>>>>>>>>>>> PRODUCT DETAILS >>>>>>>>>>>>>>>>>>'
  puts data["id"]
  puts data["title"]
  puts data["created_at"]
  puts '---- REVIEWS'
  data["reviews"].each do |review|
    puts review['body']
    puts '--------------------'
  end
  puts '>>>>>>>>>>>>> PRODUCT DETAILS >>>>>>>>>>>>>>>>>>'
end

loop do
  puts 'Enter one of those commands: s (show), u (update), d (delete) or e (exit)'
  print 'The command: '
  user_input = gets.chomp
  if user_input == 'e'
    break
  elsif user_input == 's'
    show(conn)
  elsif user_input == 'u'
    update(conn)
  elsif user_input == 'd'
    destroy(conn)
  else
    puts 'Command not recognized'
  end
end
