class Tweet < ActiveRecord::Base
	  validates :tweet_id, uniqueness: true

	  geocoded_by :location,
		  :latitude => :Latitude, :longitude => :Longitude

		after_validation :geocode

end
