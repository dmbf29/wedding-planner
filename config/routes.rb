Rails.application.routes.draw do
  devise_for :users
  scope '(:locale)', locale: /en|kr/ do
    root to: "pages#home"
    get 'travel', to: 'pages#travel'
    get 'schedule', to: 'pages#schedule'
    get 'question', to: 'pages#question'
    get 'registry', to: 'pages#registry'
  end
end
