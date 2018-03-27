Rails.application.routes.draw do
  get 'pages/home' => 'pages#home'
  get 'pages/create' => 'pages#create'
  get 'pages/:id'  => 'pages#edit'
  get 'pages/disconnect' => 'pages#disconnect'

  post 'pages/login' => 'pages#login'
  post 'pages/create' => 'pages#add_quote'

  delete 'pages/:id' => 'pages#destroy'

  patch 'pages/:id' => 'pages#update'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
