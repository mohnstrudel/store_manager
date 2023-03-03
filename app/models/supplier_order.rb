class SupplierOrder < ApplicationRecord
  include Order

  belongs_to :product
  has_many :payments, as: :payable, dependent: :destroy

  validates :price, :supplier, :amount, presence: true

  accepts_nested_attributes_for :payments, allow_destroy: true

  # @note Schulden pro Hersteller
  def self.debt
    orders = SupplierOrder.preload(:payments).all

    debt = Hash.new(0)

    orders.to_a.group_by(&:supplier).each do |grouped_by, supplier_orders|
      supplier_orders.each do |order|
        einkauf = (order.price * order.amount)
        bezahlt = order.payments.pluck(:amount).sum * order.amount
        debt[grouped_by] += einkauf - bezahlt
      end
    end
    debt
  end

  # @note Gesamtschulden
  def self.total_debt
    debt.values.sum
  end

  # @note Schulden pro Supplier Order
  def debt
    order_einkauf = price * amount

    order_bezahlt = payments.pluck(:amount).sum * amount

    order_einkauf - order_bezahlt
  end
end
