require 'rails_helper'
  
feature "Import Csv File" do
  scenario "visit the upload page and see the form" do
    visit root_url
    expect(page).to have_field("import_csv_file")
    expect(page).to have_button('Import')
  end
end