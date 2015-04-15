Rails.application.routes.draw do
  get 'home', to: "home#index", as: :home

  resources :questions do 
    collection do 
      post :preview
    end
  end
  post 'questions/preview', to: 'questions#preview', as: :preview_question

  mount Upmin::Engine => '/admin'
  root to: 'home#index'
  devise_for :users, controllers: {sessions: 'sessions',
  registrations: 'registrations'}
  resources :users

end
