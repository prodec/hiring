class ImportCsvController < ApplicationController

  def upload    
    ImportCsv.new(import_csv_params[:import_csv][:file]).run! if import_csv_params.present?
    redirect_to elements_path
  end

  private
    def import_csv_params      
      params.permit(import_csv: :file)
    end
end