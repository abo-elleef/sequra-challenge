class Merchant < ApplicationRecord
  has_many :orders
  has_many :shoppers, through: :orders

  private
    
end
