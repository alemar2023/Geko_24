Rails.application.routes.draw do

  root to:'public#index'

  devise_for :users
  resources :users

  resources :categories do
    resources :categories_i18ns
  end

end
