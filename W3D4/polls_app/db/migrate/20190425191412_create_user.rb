class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
    end

    add_index(:users, :username, unique: true) 
  end

  def change_table
    add_column(:users, :created_at, :datetime, null: false)
end
