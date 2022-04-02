# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new]
  end
  post '/users/:user_id/posts', to: 'posts#create', as: 'create_user_post'
  post '/users/:user_id/posts/:id', to: 'comments#create', as: 'create_post_comment'
  post '/users/:user_id/posts/:id', to: 'likes#create', as: 'create_post_like'
  
  # Defines the root path route ("/")
  root "users#index"
end
