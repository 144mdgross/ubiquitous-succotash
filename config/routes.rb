Rails.application.routes.draw do
  resources :lessons, only: [:show]
end
