class RecomendationController < ApplicationController
  before_action :authenticate_user!
  def show
    @user_recomendation = Recomendation.find_by(:user_id => current_user.id)
    if @user_recomendation
      @fav_place = Place.find(@user_recomendation.place_id)
      @fav_kind_places = Place.where(:kind_id => @user_recomendation.kind_id).includes(:rating).order('ratings.points asc')
      @fav_cuisine_places =Place.where(:cuisine_id => @user_recomendation.cuisine_id).includes(:rating).order('ratings.points asc')
    end
  end
end
