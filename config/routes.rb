# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new]
  end
  post '/users/:user_id/posts', to: 'posts#create', as: 'create_user_post'
  
  # Defines the root path route ("/")
  root "users#index"
end
