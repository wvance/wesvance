class AddDateColumnToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :date, :date
  end
end
