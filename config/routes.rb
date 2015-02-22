Rails.application.routes.draw do
  root to: "items#index"
  get "/items/example"
  resources :items 
end
