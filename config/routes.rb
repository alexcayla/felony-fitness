Rails.application.routes.draw do
  get 'bookings/create'
  get 'bookings/edit'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Let's write the routes

  resources :users do
    resources :instructors
  end

  resources :activity_types

  resources :scheduled_activities do
    resources :bookings,  only: [:index, :new, :edit, :create, :show, :delete]
  end

  resources :bookings do
    resources :reviews, only: [:index, :new, :update, :edit, :create, :show]
  end


end
