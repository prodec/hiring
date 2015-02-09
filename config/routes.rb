Rails.application.routes.draw do
  post "import_csv/upload"
  resources :elements, only: :index
  root to: "home#index"
end
