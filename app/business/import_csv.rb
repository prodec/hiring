require 'csv'

class ImportCsv
  attr_accessor :file

  def initialize(file)
    self.file = file
  end

  def table_mode
    CSV::read(file.path, { headers: true })
  end

  def parse
    table_mode.map {|row| row.to_hash }
  end

  def run!
    begin
      parse.each do |row|
        create_element(row)
      end
    rescue => e
      I18n.t(:invalid_input)
    end
  end

  private
    
    def create_element(row)      
      conservation = Conservation.find_or_create_by!(number: row['conservacao'])
      direction    = Direction.find_or_create_by!(name: row['sentido'])
      highway      = Highway.find_or_create_by!(name: row['rodovia'], direction: direction)
      element      = Element.create!(name: row['tipo'], highway: highway, conservation: conservation)      
    end
end

