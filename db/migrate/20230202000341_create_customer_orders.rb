class CreateCustomerOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_orders do |t|
      t.references :product, null: false, foreign_key: true
      t.string :name
      t.string :address
      t.string :email
      t.float :paid_amount
      t.string :state

      t.timestamps
    end
  end
end
