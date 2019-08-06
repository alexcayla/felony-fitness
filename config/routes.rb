Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Let's write the routes

  resources :users do

  end

  resources :activity_types do
    resources :scheduled_activities
  end

  resources :bookings

  resources :reviews


end
