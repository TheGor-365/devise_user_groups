Rails.application.routes.draw do
  root "pages#home"

  devise_for :users

  resources :posts

  resources :groups do
    resources :posts
    
    post   'join',  on: :member
    delete 'leave', on: :member
  end
end
