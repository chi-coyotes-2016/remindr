Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#index'
  
  resources :sessions, only: [:new, :create, :delete]
  resources :users do
    resources :reminders
  end
  
end
