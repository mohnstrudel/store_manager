class RemoveProductsFromSupplierOrder < ActiveRecord::Migration[7.0]
  def change
    remove_reference :supplier_orders, :product, null: false, foreign_key: true
  end
end
