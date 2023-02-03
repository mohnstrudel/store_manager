class SupplierOrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @supplier_order = SupplierOrder.new
  end

  def create
    @supplier_order = SupplierOrder.new(supplier_order_params)

    if @supplier_order.save
      render dashboard_index_path
    end
  end

  private

  def supplier_order_params
    params.require(:supplier_order).permit(:paid, :price, :product_id)
  end
end
