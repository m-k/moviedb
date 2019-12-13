Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :movies, only: %i[index]

  ActiveAdmin.routes(self)

  root 'movies#index'
end
