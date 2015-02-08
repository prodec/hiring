Rails.application.routes.draw do
  post "import_csv/upload"
  root to: "home#index"
end
