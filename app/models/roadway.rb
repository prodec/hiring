class Roadway < ActiveRecord::Base
  validates_presence_of :tipo
  validates_presence_of :rodovia
  validates_presence_of :sentido
  validates_presence_of :conservacao

  validates :sentido, inclusion: { in: %w(norte sul leste oeste),
    message: "%{value} is not a valid value" }

  validates :conservacao, :inclusion => {in:  [1,2,3,4,5],
    message: "%{value} is not a valid value" }

end
