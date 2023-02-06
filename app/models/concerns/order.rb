module Order
  extend ActiveSupport::Concern

  def full_title
    self.product.full_title
  end
end