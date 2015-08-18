class Content < ActiveRecord::Base
	belongs_to :admins
	has_many :posts
	has_many :tweets
	has_many :content_attachments

	validates :external_id, uniqueness: true , :allow_blank => true, :allow_nil => true
	
	accepts_nested_attributes_for :content_attachments
	

	# GEO INFO
	geocoded_by :ip, :latitude => :latitude, :longitude => :longitude

	geocoded_by :location ,
	  :latitude => :Latitude, :longitude => :Longitude	

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
