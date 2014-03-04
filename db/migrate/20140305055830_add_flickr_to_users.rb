class AddFlickrToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :flickr_user_id, :string
  end

  def self.down
    remove_column :users, :flickr_user_id, :string
  end
end
