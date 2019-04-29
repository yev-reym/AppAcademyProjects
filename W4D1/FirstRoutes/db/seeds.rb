# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

user1 = User.create!([{username: 'bigboy12'}])
user2 = User.create!([{username: 'red_cup69'}])

art1 = Artwork.create!([{title: 'The sad clown', img_url: 'sadclown.art', artist_id: user1.first.id}])
art2 = Artwork.create!([{title: 'Red Cups', img_url: 'redcup.com', artist_id: user2.first.id}])
art3 = Artwork.create!([{title: 'Cups are Red', img_url: 'redcup.com', artist_id: user2.first.id}])

arts1 = ArtworkShare.create!([{artwork_id: art1.first.id, viewer_id: user2.first.id}])
arts2 = ArtworkShare.create!([{artwork_id: art2.first.id, viewer_id: user1.first.id}])
arts3 = ArtworkShare.create!([{artwork_id: art3.first.id, viewer_id: user1.first.id}])