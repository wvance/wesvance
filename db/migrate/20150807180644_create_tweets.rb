class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :body
      t.string :user
      t.string :image
      t.string :location

      t.timestamps null: false
    end
  end
end
