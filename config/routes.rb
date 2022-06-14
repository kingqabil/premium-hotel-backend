Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_for :users, defaults: { format: :json }, path: 'users',  path_names: { sign_in: 'login', sign_out: 'logout', registration: 'signup' },
      controllers: {
        sessions: 'api/v1/sessions',
        registrations: 'api/v1/registrations'
      } 
      resources :sessions, only: [:create, :destroy]
      resources :rooms, only: %i[index create show destroy]
      resources :reservations, only: %i[index show create destroy]
    end
  end
end