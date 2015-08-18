class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 	has_many :tweets
 	has_many :post_attachments
 	has_many :posts
 	has_many :contents

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
