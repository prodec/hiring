class Element < ActiveRecord::Base
  belongs_to :conservation
  belongs_to :highway
  validates :name, :conservation_id, :highway_id, presence: true

  def self.search(params)
    elements = self.includes({highway: :direction}, :conservation)
    if params[:search].present?
      elements = elements.where("conservation_id = ?", params[:search][:conservation_id]) if params[:search][:conservation_id].present?
      elements = elements.joins(:highway).where("highways.name = ?", params[:search][:highway]) if params[:search][:highway].present?
      elements = elements.joins({highway: :direction}).where("directions.name = ?", params[:search][:direction]) if params[:search][:direction].present?
    end
    elements
  end
end
