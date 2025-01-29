Rails.application.routes.draw do
  devise_for :users
  scope '(:locale)', locale: /en|kr/ do
    root to: "pages#home"
  end
end
