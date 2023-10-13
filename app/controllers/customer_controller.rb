class CustomersController < ApplicationController
  def index
    # @customers = Customer.order(:name)
    @customers = Customer.includes(:operator, :locations).order(:name)
  end

  def block
    @customer = Customer.find(params[:id])
    @customer.update(blocked: true)
    redirect_to @customer, notice: 'Cliente bloqueado com sucesso.'
  end
end
