class WelcomeController < ApplicationController
	include TwitterHelper
	
  def index
  	@contents = Content.all.order('contents.created DESC').page(params[:page]).per(6)

  	# THIS IS FOR THE DISPLAY MAP
		@geojson = Array.new

		# PUT CONTENTS ON MAP
		if @contents.exists? 
			@contents.each do |content|
				if (content.longitude != '0.0' || content.latitude != '0.0') && (content.longitude != '' || content.latitude != '')
				  @geojson << {
				    type: 'Feature',
				    geometry: {
				      type: 'Point',
				      coordinates: [content.longitude, content.latitude]
				    },
				    properties: {
				      name: content.title,
				      body: content.body, 
				      link: "/contents/" + content.id.to_s,
				      id: content.id,
				      address: if (content.city.present? && content.state.present?) 
				      	content.city + ", " + content.state
				      end,
				      :'marker-color' => '#FFCC00',
				      :'marker-size' => 'small'
				    }
				  }
				end
			end
		end
	
		respond_to do |format|
		  format.html
		  format.json { render json: @geojson }  # respond with the created JSON object
		end
  end
end
