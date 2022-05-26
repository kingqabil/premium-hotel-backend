# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

david = User.create!(name: 'David', email: 'david@gmail.com', password: '111111')

kids1 = Room.create!(name: 'Kids1', city: 'Muqdisho', rate: '100', room_type: 'children', amenities: 'big room', picture: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', user_id: david.id)

reservation = Reservation.create!(nights: '5', check_in: '2022-05-26', check_out: '2022-05-31', room_id: kids1.id, user_id: david.id)