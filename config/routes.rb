Rails.application.routes.draw do
  root "pages#index"

  #get "/404", :to => "errors#not_found"
  #get "/422", :to => "errors#unacceptable"
  #get "/500", :to => "errors#internal_error"


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :charges, only: [:new, :create]
  resources :users
  
  resources :ideas do
    resources :screens
    resources :bookmarks
    resources :comments
    #get 'ideas/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment
    #get '/ideas/:idea_id/comments/new(:parent_id)', to: 'comments#new', as: :new_comment
    #get '/up-vote' => 'comments#up_vote', as: :up_vote
    resource :collaborators, only: [:show, :update, :destroy]
  end
  
end
