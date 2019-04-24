class AddColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :shortened_urls, :long_url, :string
    add_column :shortened_urls, :short_url, :string
    add_column :shortened_urls, :user_id, :string 

    add_index :shortened_urls, :user_id
    add_index :shortened_urls, :long_url, unique: true 
  end
end
