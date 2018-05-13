class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_orders

  def edit
    
  end

  def show
    if current_user.admin == true
      redirect_to admin_home_url
    end

    if User.exists?(params[:id].to_i)
      @user = User.find(params[:id].to_i)
    else
      redirect_to root_path, :flash => { :error => "Такого пользователя не существует." }
    end
    if current_user != @user
      @bookings = []
    end
  end

  private

  def set_orders
    @bookings = Order.where(:user_id => params[:id])
  end
end