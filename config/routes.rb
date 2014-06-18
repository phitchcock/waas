Rails.application.routes.draw do
  root "pages#index"

  devise_for :users

  resources :charges, only: [:new, :create]
  resources :users
  
  resources :wikis do
    #resources :articles do
    resources :bookmarks
    resources :comments
    resources :collaborators, only: [:index, :create, :destroy]
  end
  
end
