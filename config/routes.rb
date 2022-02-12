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
  end

  namespace :employee do 
    get 'dashboard' => 'dashboard#index'
  end
end
