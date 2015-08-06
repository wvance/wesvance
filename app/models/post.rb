class Post < ActiveRecord::Base
	geocoded_by :ip, :latitude => :latitude, :longitude => :longitude	
	reverse_geocoded_by :latitude, :longitude do |obj,results|
	  if geo = results.first
	  	# FULL ADDRESS
	  	obj.address = geo.address 
	  	# CITY, STATE, COUNTRY & POSTAL CODE SEPERATE
	    obj.city = geo.city
	    obj.state = geo.state_code
	    obj.country = geo.country_code
	    obj.postal = geo.postal_code
	  end
	end
	mount_uploader :image, ImageUploader
	after_validation :geocode, :reverse_geocode
end
