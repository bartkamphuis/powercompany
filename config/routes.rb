Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"

  get 'pages/customer/:id', to: 'pages#show_customer', as: 'show_customer'

end
