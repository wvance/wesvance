class AddLatitudeAndLongitudeColumnToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :Latitude, :string
    add_column :tweets, :Longitude, :string
  end
end
