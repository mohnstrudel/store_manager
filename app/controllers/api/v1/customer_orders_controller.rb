class Api::V1::CustomerOrdersController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    orders = CustomerOrder.all

    if orders
      render json: {
        status: "SUCCESS",
        message: "Fetched all the orders successfully",
        data: orders
      }, status: :ok
    else
      render json: orders.errors, status: :bad_request
    end
  end

  def create
    Product.find_by_full_title(params[:product_name], params)

    order = CustomerOrder.new(customer_order_params)


    if order.save
      render json: {
        status: "SUCCESS",
        message: "Order was created successfully",
        data: order
      }, status: :created
    else
      render json: order.errors, status: :unprocessable_entity
    end
  end

  private

  def customer_order_params
    params.permit(:product_id, :name, :address, :email, :paid_amount, :state)
  end
end