class PostsController < ApplicationController
  # GET /users
  def all
    @users = User(params[:user_id])
    render json: @users.posts, status: :ok
  end

  private

  def find_user
    @user = User.find_by_username!(params[:_username])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(
      :avatar, :name, :username, :email, :password, :password_confirmation
    )
  end
end
