class WelcomeController < ApplicationController
	include TwitterHelper

  def index

  	@tweets = user_timeline(1)
  	puts @tweets.to_yaml

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
			      address: if (post.city.present? && post.state.present?) 
			      	post.city + ", " + post.state
			      end,
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
