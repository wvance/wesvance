class PostsController < ApplicationController
  before_action :authenticate_admin!, only:[:index, :new, :edit, :create, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order('posts.date DESC').page(params[:page]).per(20)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post_attachments = @post.post_attachments.all
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post_attachment = @post.post_attachments.build
  end

  # GET /posts/1/edit
  def edit
    @post_attachments = @post.post_attachments.all
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.author = current_admin.email

    # GEO LOCATION: USE PRECISE LAT LONG IF POSSIBLE, OTHERWISE USE IP CONVERSION
    if cookies[:lat_lng] != nil
      @lat_lng = cookies[:lat_lng].split("|")
      @post.latitude = @lat_lng[0]
      @post.longitude = @lat_lng[1]
    else 
      @post.ip = request.remote_ip
    end

    
    @post.date = Date.current;
    @post.time = Time.current;

    # FOR NOW, ALWAYS SET COMMENTS TO ENABLED
    @post.has_comments = true;

    respond_to do |format|
      if @post.save
        if params[:post_attachments] != nil
          params[:post_attachments]['image'].each do |a|
            @post_attachment = @post.post_attachments.create!(:image => a)
          end
        end
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, address: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, address: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :author, :body, :is_active, :date, :time, :is_comments, :rating, :ip, :address, :longitude, :latitude, :image, :post_attachments)
    end
end
