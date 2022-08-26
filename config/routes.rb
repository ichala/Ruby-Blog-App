# config/routes.rb
Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
    #Create an API endpoint to list all posts for a user.
    get '/user/:user_id/posts', to: 'posts#all'
    #Create an API endpoint to list all comments for a user's post.
    get '/posts/:post_id/comments', to: 'posts#allcoments'
    #Create an API endpoint to add a comment to a post by the current user
    post '/comment/:post_id/add', to: 'loginrequired#addcomment'
    #Add authentication to my API endpoints.
    #Login:
    post '/auth/login', to: 'authentication#login'
    #Signup:
    post '/auth/signup', to: 'users#create'
    end
  end
  get '/*a', to: 'application#not_found'
  post '/*a', to: 'application#not_found'
end
