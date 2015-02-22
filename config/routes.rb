Rails.application.routes.draw do
  root to: "items#index"
  get 'items/new', to: 'items#new', as: 'new_item'
  resources :users 
end
