Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :admin do 
    get 'dashboard' => 'dashboard#index'
    resources :employees
    resources :users
  end

  namespace :employee do 
    get 'dashboard' => 'dashboard#index'
    get 'profile' => 'dashboard#profile'
    get 'edit_profile' => 'dashboard#edit_profile'
    patch 'update_profile' => 'dashboard#update_profile'
  end
end
