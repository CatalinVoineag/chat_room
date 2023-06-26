Rails.application.routes.draw do
  devise_for :users
  resources :rooms do
    post "comments", as: :create, to: "room_comments#create"
  end

  post "room_joins/:room_id", to: "room_joins#create", as: :room_joins

  root "rooms#index"
end
