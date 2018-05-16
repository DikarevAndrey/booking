class OrdersController < ApplicationController
  before_action :set_place, only: [:new]
  def index
    @orders = Order.all
  end

  # GET /orders/new
  def new
    if !signed_in? || current_user.admin == true
      redirect_to @place, :flash => { :error => "Вы не можете бронировать." } and return
    end
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    reserved_count = Order.where("place_id = :order_place_id AND visit_date_time >= :time_start AND visit_date_time <= :time_end", {order_place_id: @order.place_id, time_start: @order.visit_date_time - 7200, time_end: @order.visit_date_time + 7200}).count

    if @order.place.seats_count - reserved_count < @order.guests_count
      redirect_to new_order_path(:place_id => @order.place_id), :flash => { :error => "На это время все столики зарезервированы." } and return
    end

    respond_to do |format|
      if @order.save
        format.html {redirect_to places_path, notice: 'Столик зарезервирован.'}
        format.json {render :show, status: :created, location: @order}
      else
        format.html {render :new}
        format.json {render json: @order.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    if Order.exists?(params[:id])
      order = Order.find(params[:id])
      puts order
      order.destroy
      redirect_to user_url(current_user), :flash => { :notice => "Бронь отменена." }
    else
      redirect_to root_path, :flash => { :error => "Ошибка." }
    end
  end

  private

  def set_place
    if !params.key?(:place_id)
      redirect_to root_path and return
    end
    @place = Place.find(params[:place_id].to_i)
    puts @place
  end

  def order_params
    params.require(:order).permit(:visit_date_time, :comment, :guests_count, :place_id)
  end
end
