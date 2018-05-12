class RecomendationController < ApplicationController
  before_action :authenticate_user!
  def show
    @user_recomendation = Recomendation.find_by(:user_id => current_user.id)
    @user_orders = Order.where(:user_id => current_user.id)
  end
end
