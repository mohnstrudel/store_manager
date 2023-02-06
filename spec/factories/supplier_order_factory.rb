FactoryBot.define do
  factory :supplier_order do
    supplier { "Supplier A" }
    order_number { "KC71662" }
    association :product
  end
end
