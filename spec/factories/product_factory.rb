FactoryBot.define do
  factory :product do
    title { 'Oppai' }
    association :brand
    association :franchise
  end
end