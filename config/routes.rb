Rails.application.routes.draw do

  resources :profiles

  get 'home', to: "static_pages#home", as: :home

  get 'lawyer', to: "static_pages#lawyer", as: :lawyer

  resources :questions do 
    collection do 
      post :preview
      post :modify
      get :list
    end
  end

  mount Upmin::Engine => '/admin'
  root to: 'static_pages#home'
  devise_for :users, controllers: {sessions: 'sessions',
  registrations: 'registrations'}
  resources :users 

end
