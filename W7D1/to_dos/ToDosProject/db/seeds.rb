# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Todo.destroy_all

todo1 = Todo.create!({title: 'Finish Rails', body: 'I am dying', done: false})
todo2 = Todo.create!({title: 'Finish Middleware', body: 'I dont like it', done: true})
todo3 = Todo.create!({title: 'Get a job', body: 'I hope this is worth it', done: false})