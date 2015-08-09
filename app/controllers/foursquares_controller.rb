class FoursquaresController < ApplicationController
  before_action :set_foursquare, only: [:show, :edit, :update, :destroy]

  include FoursquaresHelper

  # GET /foursquares
  # GET /foursquares.json
  def index
    @foursquares = Foursquare.all
  end

  # GET /foursquares/1
  # GET /foursquares/1.json
  def show
  end

  # GET /foursquares/new
  def new
    @foursquare = Foursquare.new
  end

  # GET /foursquares/1/edit
  def edit
  end

  # POST /foursquares
  # POST /foursquares.json
  def create
    @foursquare = Foursquare.new
    checkin = user_checkins()

    @foursquare.body = checkin.body

    respond_to do |format|
      if @foursquare.save
        format.html { redirect_to @foursquare, notice: 'Foursquare was successfully created.' }
        format.json { render :show, status: :created, location: @foursquare }
      else
        format.html { render :new }
        format.json { render json: @foursquare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foursquares/1
  # PATCH/PUT /foursquares/1.json
  def update
    respond_to do |format|
      if @foursquare.update(foursquare_params)
        format.html { redirect_to @foursquare, notice: 'Foursquare was successfully updated.' }
        format.json { render :show, status: :ok, location: @foursquare }
      else
        format.html { render :edit }
        format.json { render json: @foursquare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foursquares/1
  # DELETE /foursquares/1.json
  def destroy
    @foursquare.destroy
    respond_to do |format|
      format.html { redirect_to foursquares_url, notice: 'Foursquare was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foursquare
      @foursquare = Foursquare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foursquare_params
      params.require(:foursquare).permit(:body, :user, :image, :location, :post_id, :url, :date, :latitude, :longitude)
    end
end
