Rails.application.routes.draw do
  root "pages#index"

  #get "/404", :to => "errors#not_found"
  #get "/422", :to => "errors#unacceptable"
  #get "/500", :to => "errors#internal_error"


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
