Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, defaults: {format: :json}
  resources :helper, defaults: {format: :json}
  resources :helper_types, defaults: {format: :json}
  resources :user_requests, defaults: {format: :json}
end
