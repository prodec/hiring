class Element < ActiveRecord::Base
  belongs_to :conservation
  belongs_to :highway
  validates :name, :conservation_id, :highway_id, presence: true
end
