class AddAmountToSupplierOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :supplier_orders, :amount, :integer
  end
end
