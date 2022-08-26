class Api::V1::PostsController < ApplicationController
  # GET /users
  def all
    @users = User.find(params[:user_id])
    render json: @users.posts, status: :ok
  end

  # GET /users/{username}
  def allcoments
    @post = Post.find(params[:post_id])
    render json: @post.comments, status: :ok
  end

  def user_params
    params.permit(
      :avatar, :name, :username, :email, :password, :password_confirmation
    )
  end
end
