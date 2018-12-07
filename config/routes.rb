Rails.application.routes.draw do
  root to: 'pages#welcome'

  get 'pages/welcome'
  get 'pages/job'
  get 'pages/contact'

  resources :owners
  resources :users
  resources :walkers
  resources :admins
  resources :service_appointments

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dogs, :appointments, :services, :sessions

  resources :appointments do
    member do
      get :toggle_status
    end
  end
end
