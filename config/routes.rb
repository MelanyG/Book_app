Rails.application.routes.draw do
  get 'welcome/index'

  resources :fantastic_books do
  	resources :comments
  end

  root 'welcome#index'
end
