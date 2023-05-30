Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :simple_posts, only: [:index, :show]

  post '/api/simple_posts', to: 'api/simple_posts#create'
  post '/api/simple_posts/unpublish', to: 'api/simple_posts#destroy'
end
