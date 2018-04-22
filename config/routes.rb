Rails.application.routes.draw do

  root 'top#index'
  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  resources :teams do
    get 'select', on: :member
    resources :categories do
      resources :posts, only: %i(new create edit update destroy)
    end
  end

  resources :posts, only: %i(show) do
    resources :comments, only: %i(create destroy)
  end

  resources :selectable_posts, only: %i(new create)
end
