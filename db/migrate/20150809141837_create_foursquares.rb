class CreateFoursquares < ActiveRecord::Migration
  def change
    create_table :foursquares do |t|
      t.string :body
      t.string :user
      t.string :image
      t.string :location
      t.string :post_id
      t.string :url
      t.date :date
      t.string :latitude
      t.string :longitude

      t.timestamps null: false
    end
  end
end
