class ContentAttachment < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	belongs_to :content
  belongs_to :users
end
