Rails.application.routes.draw do
  root 'top#index'
  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  resources :teams do
    resources :categories do
    end
  end

  resources :posts, only: %i(show) do
    resources :comments, only: %i(create destroy)
  end
end
