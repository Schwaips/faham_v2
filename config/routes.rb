Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "mentions_legales", to: "pages#mentions_legales"

  resources :leads, only: [:create]
end
