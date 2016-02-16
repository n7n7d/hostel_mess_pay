# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

User.create!(roll_number:  "101303147",
             email: "nischay007@gmail.com",
             password:              "sandy0564",
             password_confirmation: "sandy0564",
             activated: true,
             activated_at: Time.zone.now)
