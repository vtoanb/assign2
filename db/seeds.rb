# Toan seeder

# let create user and inbox for user
20.times do
  u = User.create name: Faker::Name.name, email: Faker::Internet.email, password: '123456'
  Inbox.create user: u
end

# let create messages
User.all.each do |u|
  u.inbox.messages.create subject: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, status: false
end

user = User.count
# let create recipient
Message.all.each do |m|
  Recipient.create(message: m, user: User.find(Random.rand(1..user)))
end

# make some of them become friend
User.all.each do |u|
  u.friend_ships.create(friend: User.find(Random.rand(1..user)))
end

# def self.anyuser
#   user = User.count
#   return Random.rand(user)
# end
