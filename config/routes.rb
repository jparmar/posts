Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'

  resources :posts do
    resources :comments
  end

  match ':controller(/:action(/:id(.:format)))', :via => [:get, :post]

  resources :comments do
    resources :comments
  end
end
