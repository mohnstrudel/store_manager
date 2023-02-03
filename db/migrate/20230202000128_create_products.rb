class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.float :price
      t.string :title
      t.string :brand
      t.string :version
      t.string :size

      t.timestamps
    end
  end
end
