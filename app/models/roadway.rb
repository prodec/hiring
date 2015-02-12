class Roadway < ActiveRecord::Base
  validates_presence_of :tipo
  validates_presence_of :rodovia
  validates_presence_of :sentido
  validates_presence_of :conservacao

  validates :sentido, inclusion: { in: %w(norte sul leste oeste),
    message: "%{value} is not a valid value" }

  validates :conservacao, :inclusion => {in:  [1,2,3,4,5],
    message: "%{value} is not a valid value" }

  def self.import(file)
    erros = Array.new
    CSV.foreach(file.path, headers: true).each_with_index do |row, i|
      @roadway = Roadway.create row.to_hash
      if not @roadway.save
        erros << i+1
      end
    end
    return erros
  end

end
