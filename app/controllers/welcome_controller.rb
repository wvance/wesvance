class WelcomeController < ApplicationController
	include TwitterHelper

  def index
  	@posts = Post.all.order('posts.date DESC').page(params[:page]).per(6)
  	@tweets = Tweet.all

  	@post = Post.new(:is_active => true)

  	# THIS IS FOR THE DISPLAY MAP
	  @allPosts = Post.all
		@geojson = Array.new

		# PUT POSTS ON MAP
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
			      link: "/posts/" + post.id.to_s,
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

		# PUT TWEETS ON MAP
		@tweets.each do |tweet|
			if (tweet.Longitude != '0.0' || tweet.Latitude != '0.0') && (tweet.Longitude != '' || tweet.Latitude != '')
			  @geojson << {
			    type: 'Feature',
			    geometry: {
			      type: 'Point',
			      coordinates: [tweet.Longitude, tweet.Latitude]
			    },
			    properties: {
			    	name: "Tweet",
			    	link: tweet.url.to_s,
			      body: tweet.body, 
			      date: tweet.date,
			      id: tweet.tweet_id,
			      address: if (tweet.location?) 
			      	tweet.location
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
