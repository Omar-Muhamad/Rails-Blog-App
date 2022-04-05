# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new]
  end
  post '/users/:user_id/posts', to: 'posts#create', as: 'create_user_post'
  post '/users/:user_id/posts/:id/likes', to: 'likes#create', as: 'create_post_like'
  get '/posts/:post_id/comments/new', to: 'comments#new', as: 'new_post_comment'
  post '/posts/:post_id/comments', to: 'comments#create', as: 'create_post_comment'

  delete '/users/:user_id/posts', to: 'posts#delete', as: 'delete_user_post'

  # Defines the root path route ("/")
  root "users#index"
end
