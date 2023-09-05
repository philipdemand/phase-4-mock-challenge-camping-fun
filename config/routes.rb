Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :activities, only: [:index, :new, :destroy] 
  resources :signups, only: [:new, :create]
  resources :campers, except: [:update, :destroy]
end


