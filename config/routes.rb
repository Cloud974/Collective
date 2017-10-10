Rails.application.routes.draw do

  devise_for :users

  resources :wikis

  resources :charges, only: [:new, :create]

  get 'about' => 'welcome#about'
  root 'welcome#index'

  resources :users do
    member do
      post :cancel_premium
    end
  end

end
