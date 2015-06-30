class Post < ActiveRecord::Base
	geocoded_by :ip, :latitude => :latitude, :longitude => :longitude
 	after_validation :geocode
end
