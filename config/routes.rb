Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  get '/users/current_user', to: 'users/current_user#show'

  namespace :api do
    namespace :v1 do
      resources :videos, only: %i[index create destroy]
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check
end
