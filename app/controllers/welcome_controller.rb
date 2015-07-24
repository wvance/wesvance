class WelcomeController < ApplicationController
  def index
  	@posts = Post.all.order('posts.date DESC').page(params[:page]).per(6)
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
			      body: post.body, 
			      date: post.date, 
			      id: post.id,
			      address: post.city + ", " + post.state,
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
