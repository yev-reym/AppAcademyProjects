

json.array! gifts do |gift|
    debugger
    json.extract! gift, :title, :description, :guest
end