# == Schema Information
#
# Table name: responses
#
#  id               :bigint(8)        not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
    validates( :user_id,  presence: true )
    validates(:answer_choice_id, presence: true)
    validate :not_duplicate_response

    belongs_to :respondent,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User 

    belongs_to :answer_choice,
        primary_key: :id,
        foreign_key: :answer_choice_id,
        class_name: :AnswerChoice

    has_one :question, 
        through: :answer_choice,
        source: :question

    private

    def sibling_responses
        self.question.responses.where.not("responses.id = ? ", self.id)
    end

    def respondent_already_answered?
        self.sibling_responses.exists?(user_id: self.user_id)
    end


    def not_duplicate_response
        if respondent_already_answered?
            errors[:respondent] << "The respondent has already answered the question"
        end
    end
end

