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
    puts 
    @order = Order.new(order_params)
    @order.user_id = current_user.id

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
