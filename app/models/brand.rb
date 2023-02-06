class Brand < ApplicationRecord

  has_many :products
  has_many :supplier_orders
end
