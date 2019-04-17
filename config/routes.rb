Rails.application.routes.draw do
  resources :event_registers
  devise_for :admins
  get 'home/index'
  resources :settings
  resources :events
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :user_temp, path: "user_temp"
      resources :registrar_evento, path: "registrar_evento"
      resources :get_eventos, path: "get_eventos"
    end
  end
end
