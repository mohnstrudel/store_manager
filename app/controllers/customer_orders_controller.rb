class CustomerOrdersController < ApplicationController
  def index
    @orders = CustomerOrder.preload(:product).all
  end

  def show
  end

  def new
    @customer_order = CustomerOrder.new
  end

  def create
    @customer_order = CustomerOrder.new(customer_order_params)

    @customer_order.save
  end

  private

  def customer_order_params
    params.require(:customer_order).permit(:product_id, :name, :address, :email, :paid_amount, :state)
  end
end
