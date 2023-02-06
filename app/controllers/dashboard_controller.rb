class DashboardController < ApplicationController
  def index
    @products = Product.last(5)
    @supplier_orders = SupplierOrder.last(5)
    @customer_orders = CustomerOrder.last(5)
    @brands = Brand.last(5)
    @franchises = Franchise.last(5)

    @debt = SupplierOrder.debt
    @total_debt = SupplierOrder.total_debt
  end
end