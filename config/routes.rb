Rails.application.routes.draw do
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :products
  resources :shoppingcarts
  resources :orders
  resources :product_orders , only: [:create, :update, :destroy]
  resource :payments , only: [:new, :create,:show]

  root 'products#index'
  
  #devise_scope :user do
  #delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #end

end
