Rails.application.routes.draw do
  devise_for :users
  resources :rooms

  post "room_joins/:room_id", to: "room_joins#create", as: :room_joins

  root "rooms#index"
end
