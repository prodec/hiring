require 'rails_helper'

RSpec.describe Highway, type: :model do
  [:name, :direction_id].each do |attr|
    it { should validate_presence_of(attr) }
  end

  it { should belong_to(:direction) }
  
end
