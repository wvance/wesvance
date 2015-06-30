class WelcomeController < ApplicationController
  def index
  	@posts = Post.all.order('posts.date ASC').page(params[:page]).per(2)
  	@post = Post.new(:is_active => true)
  end
end
