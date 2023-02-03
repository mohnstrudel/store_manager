class CustomerOrder < ApplicationRecord
  belongs_to :product

  def check_coverage
    einkauf = SupplierOrder.where(product_id: product_id).count

    verkauf = self.class.where(product_id: product_id).count

    einkauf - verkauf
  end
end
