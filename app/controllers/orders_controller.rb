class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  # GET /orders/new
  def new
    @order = Order.new
  end
end
