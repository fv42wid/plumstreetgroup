class Customer < ApplicationRecord
  has_many :invoices
  has_many :charges
end
