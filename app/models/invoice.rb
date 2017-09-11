class Invoice < ApplicationRecord
  before_create :create_password

  belongs_to :customer
  has_many :charges

  private

    def create_password
      self.password = (0..10).map {(65 + rand(26)).chr}.join
    end
end
