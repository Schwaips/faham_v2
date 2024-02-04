Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "mentions_legales", to: "pages#mentions_legales"

  resources :leads, only: [:create]

  resources :admin, only: [:index], controller: "admin/dashboard"
  resources :articles, only: [:index, :show]


  namespace :admin do 
    resources :leads, only: [:index, :new, :create, :show, :destroy]
    resources :articles, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    # resources :testimonies, only: [:index, :show, :destroy, :edit, :update]
    # resources :trusted_customers, only: [:index, :show, :destroy, :edit, :update]
  end 
end
