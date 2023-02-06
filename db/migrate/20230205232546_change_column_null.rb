class ChangeColumnNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:payments, :expense_id, true)
    change_column_null(:payments, :supplier_order_id, true)
  end
end
