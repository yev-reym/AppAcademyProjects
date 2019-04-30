class AddNull < ActiveRecord::Migration[5.2]
  def change
      remove_column :cats, :birth_date
      remove_column :cats, :color
      remove_column :cats, :name
      remove_column :cats, :sex
      remove_column :cats, :description

      add_column :cats, :birth_date, :date, null: false
      add_column :cats, :color, :string,  null: false
      add_column :cats, :name, :string, null: false
      add_column :cats, :sex, :string, limit: 1, null: false
      add_column :cats, :description, :text, null: false
  end
end
