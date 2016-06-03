Rails.application.routes.draw do
  root 'cocktails#index'
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
    resources :reviews, only: [:new, :create, :show]
  end
  resources :doses, only: [:destroy]

  mount Attachinary::Engine => "/attachinary"

end
