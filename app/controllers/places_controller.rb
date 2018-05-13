class PlacesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_if_admin, only: [:new, :edit]
  # GET /places
  # GET /places.json
  def index
    @places = Place.all.order(name: :asc).includes(:feature, :location)
    params.permit(:hookah, :smoke_alowed, :beer, :cocktails, :strong_alco, :kind_id, :cuisine_id)
    Feature.column_names.each do |column|
      if params.include? column
        @places = @places.where("features.#{column}" => true)
      end
    end
    if params[:kind_id] && params[:kind_id] != 'nil'
      @places = @places.where(:kind_id => params[:kind_id])
    end
    if params[:cuisine_id] && params[:cuisine_id] != 'nil'
      @places = @places.where(:cuisine_id => params[:cuisine_id])
    end
    if params[:city_id] && params[:city_id] != 'nil'
      @places = @places.where("locations.city_id" => params[:city_id])
    end
    if params[:subway_id] && params[:subway_id] != 'nil'
      @places = @places.where("locations.subway_id" => params[:subway_id])
    end
  end

  # GET /places/1
  # GET /places/1.json
  def show
    @reviews = Review.where(:place_id => @place.id).order(created_at: :desc)
  end

  def new_review
    review = Review.create(:place_id => params[:place_id].to_i, :user_id => current_user.id, :comment => params[:comment], :points => params[:points].to_i)
    @place = Place.find(params[:place_id].to_i)
    redirect_to @place, notice: 'Ваш отзыв отправлен.'
  end

  # GET /places/new
  def new
    if Administrator.exists?(user_id: current_user.id)
      redirect_to admin_home_url, :flash => { :error => "Ваше заведение уже зарегистрировано." }
    end

    @place = Place.new
    @place.build_location
    @place.location.build_city
    @place.location.build_subway
    @place.build_feature
    @place.build_kind
    @place.build_rating
  end

  # GET /places/1/edit
  def edit
    if @place.id != Administrator.find_by(user_id: current_user.id).place_id
      redirect_to admin_home_url, :flash => { :error => "У вас нет доступа к этому заведению!" }
    end

    if !@place.location
      @place.build_location
    end

    if !@place.location.city
      @place.location.build_city
    end

    if !@place.location.subway
      @place.location.build_subway
    end

    if !@place.feature
      @place.build_feature
    end

    if !@place.kind
      @place.build_kind
    end

    if !@place.rating
      @place.build_rating
    end
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        Administrator.create(user_id: current_user.id, place_id: @place.id)
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:kind_id, :cuisine_id, :name, :min_age, :open_hours, :avg_bill, :description, location_attributes: [:address, :subway_id, :city_id], feature_attributes: [:beer, :smoke_allowed, :cocktails, :hookah, :strong_alco], rating_attributes: [:stars])
    end
end
