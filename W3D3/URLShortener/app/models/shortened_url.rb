
class ShortenedUrl < ApplicationRecord

    def self.random_code
        rand_gen = SecureRandom::urlsafe_base64

        while ShortenedUrl.exists?(short_url: rand_gen)
            rand_gen =  SecureRandom::urlsafe_base64
        end 

        rand_gen
    end

    def self.create_short_url(user, long_url)
        short_url = ShortenedUrl.random_code 
        ShortenedUrl.create!(long_url: long_url, short_url: short_url, user_id: user.id)

    end 

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

end
