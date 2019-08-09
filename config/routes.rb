Rails.application.routes.draw do
  root 'n_cafe#index'
  
  get 'n_cafe/index'

  devise_for :users  
  resources :posts
  resources :posts do
    resources :comments
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
