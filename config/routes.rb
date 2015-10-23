require 'sidekiq/web'

Rails.application.routes.draw do

  root to: 'static_pages#home'

  get 'home', to: "static_pages#home", as: :home
  get 'lawyer', to: "static_pages#lawyer", as: :lawyer
  get 'addresses/:zip_code', to: "addresses#full", as: :addresses
  
  devise_for :users, controllers: {sessions: 'sessions',
  registrations: 'registrations'}

  resources :users #dit moat nei 'devise_for :users etc. komme, oars reaket d'r yts yn e knoop
  resources :profiles do
    collection do
      get :search
    end
  end  

  resources :answers
  resources :questions do 
    collection do 
      post :preview
      post :modify
      get :list
    end
  end
  
  resources :endorsements, only: [:create, :destroy], param: :answer_id # misskien moat 'new' route hjir ek noch even by.
  resources :reviews, only: [:new, :create, :destroy]  

  mount Upmin::Engine => '/admin'
  mount Sidekiq::Web => '/sidekiq'

end
