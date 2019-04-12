Rails.application.routes.draw do

  get 'signup', to: 'users#new', as: "signup"
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
