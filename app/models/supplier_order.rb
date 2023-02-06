class SupplierOrder < ApplicationRecord
  include Order

  belongs_to :product
  has_many :payments, as: :payable, dependent: :destroy

  accepts_nested_attributes_for :payments, allow_destroy: true
end
