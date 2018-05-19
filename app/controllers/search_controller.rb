class SearchController < ApplicationController

  def list
    @query = search_params[:q]
    @search_places = Place.where("name like ?", "%#{@query}%")
  end

  private
  def search_params
    params.permit(:q)
  end
end
