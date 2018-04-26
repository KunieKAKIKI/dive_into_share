Rails.application.routes.draw do

  root 'top#index'
  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  resources :teams, only: %i() do
    get 'select', on: :member
    resources :categories, only: %i() do
      resources :posts, only: %i(new create), module: :categories
    end
  end

  resources :posts, only: %i(show new create) do
    resources :comments, only: %i(create destroy)
  end
end
