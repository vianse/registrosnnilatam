Rails.application.routes.draw do
  resources :event_registers
  devise_for :admins
  resources :admins
  get 'home/index'
  resources :settings
  resources :events
  root 'home#index'
  get '/reports_all', to: 'event_registers#reports_all'
  get '/reports_event', to: 'event_registers#reports_event'
  get '/thankyou', to: 'home#thankyou'
   devise_scope :admins do
     get "admins/sign_in" => "devise/sessions#new"
     post "admins/sign_in" => "devise/sessions#create"
     
   end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :user_temp, path: "user_temp"
      resources :registrar_evento, path: "registrar_evento"
      resources :get_eventos, path: "get_eventos"
      resources :create_admin, path: "create_admin"
    end
  end
end
