Rails.application.routes.draw do
  devise_for :users, skip: [:sessions], :controllers => { :passwords => "passwords" }

  devise_scope :user do
    get 'signin', to: 'devise/sessions#new', as: :signin
    post 'signin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :signout

    get 'signup', to: 'devise/registrations#new', as: :signup
  end

  root 'welcome#index', as: :root

  resources :characters
  
  resources :character_attributes, only: [:create, :update, :destroy]
  
end
