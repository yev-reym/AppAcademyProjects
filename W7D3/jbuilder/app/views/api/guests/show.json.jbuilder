
# moved to partial
# json.extract! @users, :name, :age, :favorite_color

json.partial! './api/guests/guest', guest: @guest, gifts: @guest.gifts