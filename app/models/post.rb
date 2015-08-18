class Post < ActiveRecord::Base
	has_many :post_attachments
	belongs_to :admins
	belongs_to :contents
	
	accepts_nested_attributes_for :post_attachments
	
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

	after_validation :geocode, :reverse_geocode
end
