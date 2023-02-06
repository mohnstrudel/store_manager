class DashboardController < ApplicationController
  def index
    @products = Product.last(5)
    @supplier_orders = SupplierOrder.last(5)
    @customer_orders = CustomerOrder.last(5)
    @brands = Brand.last(5)
    @franchises = Franchise.last(5)

    @debt = debt
  end

  def debt
    orders = SupplierOrder.pluck(:amount, :price, :paid)

    debt = 0
    orders.each do |order|
      debt += (order[0].to_i * order[1].to_i) - (order[0].to_i * order[2].to_i)
    end

    debt
  end
end
