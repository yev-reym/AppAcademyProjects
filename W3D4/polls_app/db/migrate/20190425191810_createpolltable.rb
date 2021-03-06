class Createpolltable < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.string :title, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end

  def change_table
    add_column(:users, :created_at, :datetime, null: false)
  end
end
