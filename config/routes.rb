Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get 'ratings_controller/update'

  root to: "items#index" 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
 

  # get 'items/index', as: 'user_root'

  get 'persons/profile'
  get "/carts/update"
  get "/users/example"
  get "/items/example"
  get "/carts/submit_cart", to: "carts#submit_cart", as: "submit_cart"
  get "/carts/push", to: "carts#push", as: "push_item" 
  get "/carts/pull", to: "carts#pull", as: "throw_away"
  get "/items/add_image", to: "items#add_image", as: "add_image"
  resources :histories
  resources :carts   
  resources :roles  
  resources :items 
  resources :users
  resources :ratings, only: :update
end
