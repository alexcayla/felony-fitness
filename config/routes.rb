Rails.application.routes.draw do
  get 'bookings/create'
  get 'bookings/edit'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Let's write the routes

  resources :users
  resources :instructors
  resources :activity_types
  resources :scheduled_activities do
    resources :bookings#,  only: [:index, :new, :edit, :create]
  end

  resources :bookings, except:  [:edit, :create] do
    resources :reviews, only: [:index, :new, :update, :edit, :create]
  end

  resources :reviews, only: [:show ]

  get  '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  get '/activities_home', to: 'pages#activities_home', as: 'scheduled_activities_page'

end
