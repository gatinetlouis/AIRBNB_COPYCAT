Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  resources :profiles, only: [:show]


  resources :cars do
    resources :rentals, only: [:new, :create]
    resources :reviews, only: [:index, :show]
  end
  resources :rentals, only: [:index, :show, :destroy] do
    resources :reviews, only: [:new, :create, :destroy]
  end


  # resources :reviews, only: [:index, :show]

    # resources :rentals, only: [:index, :new, :create, :show, :destroy] do
      # resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


