class AddProductsToSupplierOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :supplier_orders, :product, foreign_key: true
  end
end
