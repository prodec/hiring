class Direction < ActiveRecord::Base
  validates :name, presence: true
end
