Rails.application.routes.draw do
  root "pages#index"
  resources :users
  resources :wikis
end
