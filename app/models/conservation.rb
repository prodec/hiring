class Conservation < ActiveRecord::Base
  validates :number, numericality: { greater_than_or_equal_to: 0 }
end
