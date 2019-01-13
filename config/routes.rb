Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  post 'login', to: 'welcome#create'
  delete 'logout', to: 'welcome#destroy'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
