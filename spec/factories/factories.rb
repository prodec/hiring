FactoryGirl.define do

  factory :conservation do
    number 1
  end

  factory :direction do
    name "south"
  end

  factory :highway do
    name "br-153"
    direction
  end

  factory :element do
    name "placa"
    conservation
    highway
  end

end
