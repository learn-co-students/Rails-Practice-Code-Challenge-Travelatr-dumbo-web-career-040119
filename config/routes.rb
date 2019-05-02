Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers, only: [:new, :create, :show, :index]
  resources :posts, only: [:new, :create, :show, :edit, :update, :index]
  # put '/post/:id/like', to: 'posts#like', as: 'like'
  resources :destinations, only: [:show, :index]
  # post '/post/:id/like', to: 'posts#like', as: 'like_post'
  # post '/post/:id/unlike', to: 'posts#unlike', as: 'unlike_post'
end
