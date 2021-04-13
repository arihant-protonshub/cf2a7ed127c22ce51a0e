Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :user, only: [:create, :show, :update, :destroy]
    get 'typeahead/:input', to: 'typeahead#search'
    get 'users', to: 'user#index'
  end
end
