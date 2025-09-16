Rails.application.routes.draw do
  devise_for :users
  scope '(:locale)', locale: /en|kr/ do
    root to: "pages#home"
    get 'travel', to: 'pages#travel'
    get 'schedule', to: 'pages#schedule'
    get 'question', to: 'pages#question'
    get 'registry', to: 'pages#registry'
    get 'photos', to: 'pages#photos'
    get 'rsvp', to: 'pages#rsvp'
    resources :people, only: [:update]
    resources :uploads, only: [:index, :create]
    resources :invitations, only: [:index, :update]
    resources :groups, only: [:show, :create] do
      member do
        get :email
        post :send_email
      end
    end
    namespace :admin do
      resources :invitations, only: [:index]
    end
  end
end
