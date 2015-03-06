class Dado < ActiveRecord::Base

validates :tipo, presence: true
validates :rodovia, presence: true
validates :sentido, presence: true
validates :conservacao, presence: true, numericality: { only_integer: true }

def self.search(search)

  if search
    self.where('tipo LIKE ? or rodovia LIKE ? or sentido LIKE ? or conservacao LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  else
  	self.all 
  end
  
end

end
