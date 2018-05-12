class SearchController < ApplicationController

  def list
    @search_places = Place.where("name like ?", "%#{search_params[:q]}%")
  end

  private
  def search_params
    params.permit(:q)
  end
end
