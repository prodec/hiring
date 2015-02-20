class Point < ActiveRecord::Base
	SENTIDO_VALUES = %w( norte sul leste oeste )
	validates_presence_of :conservacao, :rodovia, :sentido, :tipo
	validates_numericality_of :conservacao, only_integer: true
	validates_inclusion_of :conservacao, in: 1..5, message: "should be a number between 1 and 5"
	validates_inclusion_of :sentido, in: SENTIDO_VALUES , message: "%{value} is not included in permitted list"
	scope :sentido_dist, ->{ select(:sentido).uniq }

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			create_from_csv_row(row)
		end
	end

	def self.create_from_csv_row(row)
		#caso no csv também tenha coluna id, ele atualiza os dados
		ponto = find_by_id(row['id']) || new 
		parameters = ActionController::Parameters.new(row.to_hash)
		ponto.update(parameters.permit(:tipo,:rodovia, :sentido, :conservacao))
		ponto.save!
  	end

end
