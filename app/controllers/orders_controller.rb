# app/controllers/orders_controller.rb

class OrdersController < ApplicationController
  def index
    @customer = Customer.find(params[:customer_id])
    @orders = @customer.orders
  end
end
