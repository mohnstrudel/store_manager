class CreateSupplierOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :supplier_orders do |t|
      t.references :product, null: false, foreign_key: true
      t.float :paid

      t.timestamps
    end
  end
end
