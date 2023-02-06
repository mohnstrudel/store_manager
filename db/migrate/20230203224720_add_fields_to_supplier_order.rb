class AddFieldsToSupplierOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :supplier_orders, :supplier, :string
    add_column :supplier_orders, :order_number, :string
  end
end
