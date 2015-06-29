class WelcomeController < ApplicationController
  def index
  	@posts = Post.all.order('posts.title ASC').page(params[:page]).per(4)
  	@post = Post.new(:is_active => true)
  end
end
