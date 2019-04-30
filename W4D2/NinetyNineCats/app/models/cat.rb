require 'action_view'

class Cat < ApplicationRecord
    validates :color, inclusion: { in: %w(red blue yellow green) }
    validates :sex, inclusion: { in: %w(M F) }
    validates :birth_date, :name, :description, presence: true
   
    include ActionView::Helpers::DateHelper



    def age
        time_ago_in_words(self.birth_date)
    end

end