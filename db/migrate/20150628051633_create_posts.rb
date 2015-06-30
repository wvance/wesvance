class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :author
      t.text :body

      t.string :address
      t.string :ip
      t.string :latitude
      t.string :longitude 

      t.boolean :is_active
      t.boolean :is_comments

      t.datetime :dateTime
      t.integer :rating
      t.timestamps null: false
    end
  end
end
