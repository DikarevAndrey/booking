class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin

  def home
    if Administrator.exists?(user_id: current_user.id)
      @place = Place.find(Administrator.find_by(user_id: current_user.id).place_id)
      @offers = Offer.where(place_id: Administrator.find_by(user_id: current_user.id).place_id)
    else
      redirect_to new_place_url, :flash => { :error => "Сначала добавьте своё заведение." }
    end
  end

  def add
    redirect_to new_place_url
  end

  def edit
    if Administrator.exists?(user_id: current_user.id)
      redirect_to edit_place_url Administrator.find_by(user_id: current_user.id).place_id
    else
      redirect_to new_place_url, :flash => { :error => "Сначала добавьте своё заведение." }
    end
  end

  def bookings
    if Administrator.exists?(user_id: current_user.id)
      @bookings = Order.where(place_id: Administrator.find_by(user_id: current_user.id).place_id).order(visit_date_time: :desc)
    else
      redirect_to new_place_url, :flash => { :error => "Сначала добавьте своё заведение." }
    end
  end
end
