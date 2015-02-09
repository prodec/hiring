class ImportCsvController < ApplicationController

  def upload    
    result = UploadCsv.call(import_csv_params)
    if result.success?
      redirect_to elements_path, notice: t('success_upload')
    else
      flash.now[:error] = t(result.message)
      render 'home/index'
    end
    
  end

  private
    def import_csv_params      
      params.permit(import_csv: :file)
    end
end