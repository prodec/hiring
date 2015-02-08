require 'rails_helper'

RSpec.describe Conservation, type: :model do
  it { should validate_numericality_of(:number).is_greater_than_or_equal_to(0) }
end
