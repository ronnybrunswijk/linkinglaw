Rails.application.routes.draw do
  get 'home/index', to: "home#index", as: :home

  resources :questions 
  post 'questions/preview', to: 'questions#preview', as: :preview_question

  mount Upmin::Engine => '/admin'
  root to: 'home#index'
  devise_for :users
  resources :users

end
