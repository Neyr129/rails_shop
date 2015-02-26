Rails.application.routes.draw do
  root to: "items#index"
  get "/items/example"
  resources :gallerys
  resources :controllers
  resources :items 
end
