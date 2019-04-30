# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

c1 = Cat.create!(birth_date: '2000-04-30', color: 'red', name: 'sparkles', sex: 'F', description: 'Not just wow, but meow' )
c2 = Cat.create!(birth_date: '1989-07-16', color: 'yellow', name: 'tweety', sex: 'M', description: 'A ball of sunshine and fruit' )
c3 = Cat.create!(birth_date: '1996-10-25', color: 'green', name: 'gato', sex: 'M', description: 'down to clown, purrrrrr' )
c4 = Cat.create!(birth_date: '1973-04-07', color: 'blue', name: 'flora' , sex: 'F', description: 'High maintence, loveable, but fickle')
c5 = Cat.create!(birth_date: '1945-01-01', color: 'red', name: 'sennacy' , sex: 'M', description: 'old, used, abused, unappreciated, but loyal. rawr')
