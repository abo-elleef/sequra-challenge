class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper
  validates_presence_of :amound

  private
    
end
