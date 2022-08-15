Rails.application.routes.draw do
  get 'users/index'
  get '/users', to: "users#index"
  get '/users/:id/', to: "users#user"
  get '/users/:id/posts', to: "users#posts"
  get '/users/:id/posts/:id', to: "users#post"
  root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
