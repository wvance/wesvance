class WelcomeController < ApplicationController
  def index
  	@posts = Post.all.order('posts.name ASC').page(params[:page]).per(4)
  	@post = Post.new(:is_active => true)

  	# THIS IS FOR THE DISPLAY MAP
	  @allPosts = Post.all
		@geojson = Array.new

		@allPosts.each do |post|
			if (post.longitude != '0.0' || post.latitude != '0.0') && (post.longitude != '' || post.latitude != '')
			  @geojson << {
			    type: 'Feature',
			    geometry: {
			      type: 'Point',
			      coordinates: [post.longitude, post.latitude]
			    },
			    properties: {
			      name: post.title,
			      :'marker-color' => '#FFCC00',
			      :'marker-size' => 'small'
			    }
			  }
			end
		end
		respond_to do |format|
		  format.html
		  format.json { render json: @geojson }  # respond with the created JSON object
		end

  end

end
