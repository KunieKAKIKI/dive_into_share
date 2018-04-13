Rails.application.routes.draw do
  root 'top#index'
  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  resources :teams, only: %i() do
    resources :categories, only: %i() do
      resources :posts, only: %i(show)
    end
  end

  resources :posts, only: %i[] do
    resources :comments   #, only: %i[create destroy edit index]
  end
end
