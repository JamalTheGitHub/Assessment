Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  get 'auth/:provider/callback', to: 'welcome#create_with_omniauth'
  post 'login', to: 'welcome#create'
  delete 'logout', to: 'welcome#destroy'
  resources :users do
    resources :posts
  end
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
