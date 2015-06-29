class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :author
      t.text :body
      t.boolean :is_active
      t.date :date
      t.time :time
      t.boolean :is_comments
      t.integer :rating

      t.timestamps null: false
    end
  end
end
