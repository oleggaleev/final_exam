Rails.application.routes.draw do
  resources :auctions do
    resources :bids, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
        resources :auctions, only: [:index, :show, :create, :update, :destroy]
        resources :tokens, only:[:create]
    end
end


  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
