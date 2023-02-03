class AddPriceToSupplierOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :supplier_orders, :price, :float
  end
end
