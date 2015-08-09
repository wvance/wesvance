module FoursquaresHelper
	@@foursquare = Foursquare2::Client.new(:client_id => ENV['FOURSQUARE_CLIENT_ID'], :client_secret =>  ENV['FOURSQUARE_CLIENT_SECRET'],:api_version => '20140806')

	def user_checkins
		user_id = "53917274"
    @@foursquare.venue_photos("51d75a32498e0d39bb28632d", options = {:group => 'venue'})
  end
end
