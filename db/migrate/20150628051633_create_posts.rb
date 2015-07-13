class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :author
      t.text :body

      t.string :address
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :postal

      t.string :ip
      t.string :latitude
      t.string :longitude

      t.boolean :is_active
      t.boolean :has_comments

      t.date :date
      t.time :time
      t.integer :rating
      t.timestamps null: false
    end
  end
end
