class WelcomeController < ApplicationController
	include TwitterHelper
	
  def index
  	@contents = Content.all.order('contents.created DESC').page(params[:page]).per(6)

  	@all_contents = Content.all.order('contents.created DESC')
  	# THIS IS FOR THE DISPLAY MAP
		@geojson = Array.new

		# PUT CONTENTS ON MAP
		if @all_contents.exists? 
			@all_contents.each do |content|
				if (content.kind == "twitter")
					marker_color = '#4099FF'
				else 
					marker_color = '#FFCC00'
				end

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
				      :'marker-color' => marker_color,
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
