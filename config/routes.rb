Rails.application.routes.draw do
  resources :questions

  mount Upmin::Engine => '/admin'
  root to: 'questions#new'
  devise_for :users
  resources :users
end
