class UploadCsv
  include Interactor

  def call
    if context.present? && context[:import_csv].present?
      import = ImportCsv.new(context[:import_csv][:file]).run!
      if import.is_a?(String)
        context.fail!(message: "invalid_input")
      end
    else
      context.fail!(message: "invalid_file")
    end
  end
end