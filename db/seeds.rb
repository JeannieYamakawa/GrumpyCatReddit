# This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
u1 = User.create(username: "User1")
u2= User.create(username: "User2")
#
# m1 = Message.create(content: "Jean message 1", user_id: u1.id)
# m2 = Message.create(content: "Jeannie's message 2", user_id: u2.id)
#
# c1 = Comment.create(text: "New Comment 1", user_id: u1.id, message_id:m1.id)
# c2= Comment.create(text: "NewComment2 on Message1", user_id: u1.id, messsage_id: m1.id)
# c3 = Comment.create(text: "New comment 3 on message 2", user_id: u2.id, message_id: m2.id)


m1= u1.messages.create(content: "User1 message 1", website: "www.example1.com")
m2 = u1.messages.create(content: "User1 message 2", website: "www.example2.com")
m3= u2.messages.create(content: "User2 message 1", website: "www.example3.com")
m4= u2.messages.create(content: "User2 message 2", website: "www.example4.com")


c1 = u1.comments.create(text: "User1 comment1 on message1", message_id: m1.id, user_id: u1.id)
c2 = u1.comments.create(text: "User1 comment2 on message1", message_id: m1.id, user_id: u1.id)
c3 = u1.comments.create(text: "User1 comment3 on message1", message_id: m2.id, user_id: u1.id)
c4 = u2.comments.create(text: "User2 comment1 on message2", message_id: m2.id, user_id: u2.id)
c5 = u2.comments.create(text: "User2 comment2 on message2", message_id: m3.id, user_id: u2.id)
c6 = u2.comments.create(text: "User2 comment3 on message2", message_id: m4.id,  user_id: u2.id)
