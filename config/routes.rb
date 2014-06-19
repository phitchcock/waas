Rails.application.routes.draw do
  root "pages#index"

  #get "/404", :to => "errors#not_found"
  #get "/422", :to => "errors#unacceptable"
  #get "/500", :to => "errors#internal_error"


  devise_for :users

  resources :charges, only: [:new, :create]
  resources :users
  
  resources :ideas do
    resources :screens
    resources :bookmarks
    resources :comments
    get '/up-vote' => 'comments#up_vote', as: :up_vote
    resources :collaborators, only: [:index, :create, :destroy]
  end
  
end
