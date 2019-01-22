Rails.application.routes.draw do
  get 'edit', to: 'posts#edit'
  delete 'delete_post', to: 'posts#destroy'
  get 'login', to: 'sessions#new'
  get 'home', to: 'welcome#home'
  get 'signup', to: 'users#new'
  get 'auth/:provider/callback', to: 'sessions#create_with_omniauth'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users do
    resources :posts
  end
  resources :posts

  post 'users/search', to: 'users#search', as: 'search_users'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
