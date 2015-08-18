class CreateContentAttachments < ActiveRecord::Migration
  def change
    create_table :content_attachments do |t|
      t.integer :content_id
      t.string :image
      t.datetime :created

      t.timestamps null: false
    end
  end
end
