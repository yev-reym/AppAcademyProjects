



json.extract! guest, :name, :age, :favorite_color 

gifts.each do |gift|
    json.gifts do 
        json.extract! gift, :title, :description
    end
end

