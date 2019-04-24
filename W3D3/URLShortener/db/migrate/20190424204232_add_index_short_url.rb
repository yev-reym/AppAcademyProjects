class AddIndexShortUrl < ActiveRecord::Migration[5.2]
  def change
    add_index :shortened_urls, :short_url, unique: true 
    remove_index :shortened_urls, :long_url
  end
end
