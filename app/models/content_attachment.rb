class ContentAttachment < ActiveRecord::Base
	belongs_to :content
  belongs_to :admins
end
