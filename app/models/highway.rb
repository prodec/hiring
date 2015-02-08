class Highway < ActiveRecord::Base
  belongs_to :direction
  validates :name, :direction_id, presence: true
end
