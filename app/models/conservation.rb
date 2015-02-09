class Conservation < ActiveRecord::Base
  validates :number, numericality: { greater_than_or_equal_to: 0 }
  scope :order_number, -> { order("number ASC")}
end