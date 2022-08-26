class Api::V1::LoginrequiredController < ApplicationController
  before_action :authorize_request, except: :create
  # GET /users

  def addcomment
    @user = @current_user
    @post = Post.find(params[:post_id])
    @comment = @current_user.comments.new(text: params[:text])
    @comment.post_id = @post.id
    @comment.save
    render json: @comment, status: :ok
  end

  def user_params
    params.permit(
      :avatar, :name, :username, :email, :password, :password_confirmation
    )
  end

  def find_user
    @user = User.find_by_username!(params[:_username])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end
end
