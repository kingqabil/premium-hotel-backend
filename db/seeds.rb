# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#sadiq = User.create!(name: 'Sadiq', email: 'sadiq@gmail.com', password: '111111')

room2 = Room.create!(name: 'Room2', city: 'Lusaka', rate: '100', room_type: 'Double', amenities: 'In-Room Cocktail Station', picture: 'https://images.all-free-download.com/images/graphiclarge/simple_room_picture_167607.jpg', user_id: '2')

room13 = Room.create!(name: 'Room3', city: 'Lusaka', rate: '100', room_type: 'Double', amenities: 'In-Room Cocktail Station', picture: 'https://images.all-free-download.com/images/graphiclarge/simple_room_picture_167607.jpg', user_id: '2')

room4 = Room.create!(name: 'Room4', city: 'Lusaka', rate: '100', room_type: 'Double', amenities: 'In-Room Cocktail Station', picture: 'https://images.all-free-download.com/images/graphiclarge/simple_room_picture_167607.jpg', user_id: '2')

room5 = Room.create!(name: 'Room5', city: 'Lusaka', rate: '100', room_type: 'Double', amenities: 'In-Room Cocktail Station', picture: 'https://images.all-free-download.com/images/graphiclarge/simple_room_picture_167607.jpg', user_id: '2')

#reservation = Reservation.create!(check_in: '2022-05-26', check_out: '2022-05-31', room_id: room1.id, user_id: '1')