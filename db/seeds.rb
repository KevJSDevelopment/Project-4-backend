# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Channel.destroy_all()
User.destroy_all()
Message.destroy_all()

newChannel = Channel.create(name: "newChannel")
newUser = User.create(username: "kdubs", first_name: "kevin", last_name: "sheehan")
newUser2 = User.create(username: "LiquidSnake", first_name: "Kalada", last_name: "William-Jumbo")
message = Message.create(text: "this is a secret", user_id: newUser.id, channel_id: newChannel.id)
message2 = Message.create(text: "2nd message", user_id: newUser2.id, channel_id: newChannel.id)

newChannel2 = Channel.create(name: "other channel")
newUser3 = User.create(username: "kivos", first_name: "kevin", last_name: "sheehan")
newUser4 = User.create(username: "ezgg", first_name: "Kalada", last_name: "William-Jumbo")
message3 = Message.create(text: "3rd", user_id: newUser3.id, channel_id: newChannel2.id)
message4 = Message.create(text: "4th", user_id: newUser4.id, channel_id: newChannel2.id)