Rails.application.routes.draw do
  resources :eventos do
    member do
      get 'reservar'
      get 'confirmar_reservacion'
      post 'confirmar_reservacion', to: 'reservations#confirmar_reservacion'
    end
    resources :reservations, only: [:new, :create]
  end
  root 'eventos#index'
end