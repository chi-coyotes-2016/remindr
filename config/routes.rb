Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#index'
  
  get '/sessions/new', to: 'sessions#new', as: :new_session
  post '/sessions', to: 'sessions#create'
  delete '/sessions' => 'sessions#destroy'
  
  resources :users do
    resources :reminders
  end

end
