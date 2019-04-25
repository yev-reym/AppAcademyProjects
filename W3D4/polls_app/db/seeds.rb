# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{username: "jon"}, {username: "taker"}, {username: "maker"}])

Poll.create([{title: '1', user_id:1},{title: '2', user_id:3},{title: '3', user_id:1},{title: '4', user_id:3},{title: '5', user_id:3}])

Question.create([{text:"what is love?", poll_id: 1}, {text: "anon is loved", poll_id: 1 }, {text:"reeeeeeeeeeee", poll_id: 2}])

AnswerChoice.create([{text: "baby don't hurt me", question_id: 1}, {text: "no more...", question_id: 1}, {text: "fake and g--!", question_id: 2},{text:"mommy i want my tendies", question_id: 3}])

Response.create([{user_id: 1, answer_choice_id: 2},{user_id: 2, answer_choice_id: 3},{user_id: 2, answer_choice_id: 4}])