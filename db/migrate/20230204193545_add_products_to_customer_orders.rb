class AddProductsToCustomerOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :customer_orders, :product, foreign_key: true
  end
end
