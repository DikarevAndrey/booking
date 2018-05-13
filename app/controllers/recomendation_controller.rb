class RecomendationController < ApplicationController
  before_action :authenticate_user!
  def show
    if current_user.admin?
      redirect_to root_path
    end

    @user_recomendation = Recomendation.find_by(:user_id => current_user.id)
    if @user_recomendation
      @fav_place = Place.find(@user_recomendation.place_id)
      @fav_kind_places = Place.where(:kind_id => @user_recomendation.kind_id).includes(:rating).order('ratings.points asc').take(5)
      @fav_cuisine_places =Place.where(:cuisine_id => @user_recomendation.cuisine_id).includes(:rating).order('ratings.points asc').take(5)
    end
  end
end
