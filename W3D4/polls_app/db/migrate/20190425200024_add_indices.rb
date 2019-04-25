class AddIndices < ActiveRecord::Migration[5.2]
  def change
    add_index(:answer_choices, :question_id)
    add_index(:polls, :user_id)
    add_index(:questions, :poll_id)
  end
end
