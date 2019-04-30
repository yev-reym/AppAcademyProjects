class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.date  :birth_date, presence: true
      t.string :color, presence: true
      t.string :name, presence: true
      t.string :sex, limit: 1, presence: true
      t.text :description, presence: true
      t.timestamps
    end
  end
end
