class CustomerOrder < ApplicationRecord

  belongs_to :product
  has_many :payments

  def check_coverage
    einkauf = SupplierOrder.where(product_id: product_id).pluck(:amount).sum

    verkauf = self.class.where(product_id: product_id).count

    [einkauf - verkauf, einkauf]
  end
end
