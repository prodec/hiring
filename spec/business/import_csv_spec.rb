require 'rails_helper'

describe ImportCsv do

  let(:valid_file) { "valid_input" }
  let(:import_csv_valid) { ImportCsv.new(sample(valid_file)) }
  let(:valid_file_output) {
    [
      {"tipo"=>"placa", "rodovia"=>"br-153", "sentido"=>"norte", "conservacao"=>"2"},
      {"tipo"=>"drenagem", "rodovia"=>"br-262", "sentido"=>"leste", "conservacao"=>"1"},
      {"tipo"=>"placa", "rodovia"=>"br-153", "sentido"=>"sul", "conservacao"=>"5"},
      {"tipo"=>"terrapleno", "rodovia"=>"br-060", "sentido"=>"norte", "conservacao"=>"4"},
      {"tipo"=>"acesso", "rodovia"=>"br-262", "sentido"=>"leste", "conservacao"=>"3"},
      {"tipo"=>"terrapleno", "rodovia"=>"transolimpica", "sentido"=>"sul", "conservacao"=>"5"}
    ]
  }

  let(:invalid_file) { "invalid_input" }
  let(:invalid_import_csv) { ImportCsv.new(sample(invalid_file)) }

  context "valid input" do
    it do
      expect(import_csv_valid).to be_an(ImportCsv)
    end

    it do
      expect(import_csv_valid.run!).to eq(valid_file_output)
    end
  end

  context "invalid input" do
    it do
      expect(invalid_import_csv.run!).to eq(I18n.t(:invalid_input))
    end
  end

  def sample(file_name)
    ActionDispatch::Http::UploadedFile.new({
      tempfile: File.new("#{Rails.root}/spec/support/#{file_name}.csv")
    })
  end

end
