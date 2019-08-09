Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # Users and instructors are independent.
  resources :users
  resources :instructors

  # Scheduled activities need to belong to an activity type
  resources :activity_types do
    resources :scheduled_activities
  end

  # Bookings need have a scheduled activity
  resources :scheduled_activities do
    resources :bookings#,  only: [:index, :new, :edit, :create]
  end

  # A user needs to have a booking to be able to leave a review
  resources :bookings, except:  [:edit, :create] do
    resources :reviews, only: [:index, :new, :update, :edit, :create]
  end

  resources :reviews, only: [:show ]

  get  '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  get '/activities_home', to: 'pages#activities_home', as: 'scheduled_activities_page'

end
