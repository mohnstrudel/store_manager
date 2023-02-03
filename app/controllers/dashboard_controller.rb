class DashboardController < ApplicationController
  def index
    @products = Product.last(5)
    @supplier_orders = SupplierOrder.last(5)
    @customer_orders = CustomerOrder.last(5)
  end
end
