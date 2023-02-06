class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.belongs_to :payable, polymorphic: true, null: false
      t.integer :parent_id
      t.float :amount

      t.timestamps
    end
  end
end
