# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Band.destroy_all

band1 = Band.create!(name: "The Spicy Men")
band1 = Band.create!(name: "Gatos Locos")
band1 = Band.create!(name: "The Cornflakes")
band1 = Band.create!(name: "Stubbed Toes")


