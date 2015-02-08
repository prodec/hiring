require 'rails_helper'

RSpec.describe Element, type: :model do
  [:name, :conservation_id, :highway_id].each do |attr|
    it { should validate_presence_of(attr) }
  end

  [:highway, :conservation].each do |asso|
    it { should belong_to(asso) }
  end
end
