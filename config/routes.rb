Rails.application.routes.draw do
  get 'pages/home' => 'pages#home'
  get 'pages/create' => 'pages#create'
  get 'pages/disconnect' => 'pages#disconnect'
  get 'pages/:id'  => 'pages#edit'

  get 'users/create' => 'users#create'
  get 'users/:id' => 'users#show', as: 'profil'


  post 'pages/login' => 'pages#login'
  post 'pages/create' => 'pages#add_quote'

  post 'users/create' => 'users#add_user'

  delete 'pages/:id' => 'pages#destroy'

  patch 'pages/:id' => 'pages#update'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
