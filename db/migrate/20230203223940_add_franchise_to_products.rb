class AddFranchiseToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :franchise, foreign_key: true
  end
end
