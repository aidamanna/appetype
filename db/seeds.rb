# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Admin', email: 'admin@appetype.com', password: 'admin', role: 'admin')
User.create(name: 'Catering', email: 'catering@appetype.com', password: 'catering', role: 'catering')
User.create(name: 'Aida', email: 'aida@appetype.com', password: 'aida', role: 'diner')

Setting.create(name: 'auth_token', value: '')
