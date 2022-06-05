# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

sadiq = User.create!(name: 'Sadiq', email: 'sadiq@gmail.com', password: '111111')

room1 = Room.create!(name: 'Room1', city: 'Lusaka', rate: '100', room_type: 'Double', amenities: 'In-Room Cocktail Station', picture: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', user_id: '1')

reservation = Reservation.create!(check_in: '2022-05-26', check_out: '2022-05-31', room_id: kids1.id, user_id: '1')