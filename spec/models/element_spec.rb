require 'rails_helper'

RSpec.describe Element, type: :model do
  [:name, :conservation_id].each do |attr|
    it { should validate_presence_of(attr) }
  end
end
