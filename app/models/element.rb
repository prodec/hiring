class Element < ActiveRecord::Base
  belongs_to :conservation
  validates :name, :conservation_id, presence: true
end
