Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'sign_up', to: 'devise/registrations#new'
  end
  get 'users/index'
  get '/users', to: "users#index"
  get '/users/:id/', to: "users#user"
  get '/users/:id/posts', to: "users#posts"
  get '/new', to: "users#new_post"
  post '/new', to: "users#save_post"
  post '/addcomment/:id', to: "users#addcomment"
  get 'addlike/:id', to: "users#addlike"
  get '/users/:id/posts/:id', to: "users#post"
  root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
