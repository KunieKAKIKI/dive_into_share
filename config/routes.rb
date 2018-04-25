Rails.application.routes.draw do

  get 'team_edit_rights/create'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'top#index'
  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  resources :teams do
    resources :users do %i(index)
      resources :team_edit_rights, only: %i(create destroy)
    end
    get 'select', on: :member
    resources :users, only: %i(index) do
      resources :memberships, only: %i(create destroy)
    end
    resources :categories do
      resources :posts, only: %i(new create edit update destroy)
    end
  end

  resources :posts, only: %i(show) do
    resources :comments, only: %i(create destroy)
  end

  resources :selectable_posts, only: %i(new create)
  resources :users, only: %i(show)

end
