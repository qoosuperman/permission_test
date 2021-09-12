# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(id: 1, name: 'A', email: 'AAA@gmail.com', password: '12345678')
User.create(id: 2, name: 'B', email: 'BBB@gmail.com', password: '12345678')

Book.create(user_id: 1, name: 'A book')
Book.create(user_id: 2, name: 'B book')