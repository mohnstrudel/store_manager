class Expense < ApplicationRecord
  has_many :payments
end
