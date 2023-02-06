class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :expense_type
      t.float :total_amount
      t.text :description

      t.timestamps
    end
  end
end
