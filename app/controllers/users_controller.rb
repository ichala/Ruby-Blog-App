class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def posts
    @user = User.find(params[:id])
  end

  def user
    @user = User.find(params[:id])
  end

  def post
    @post = Post.find(params[:id])
  end
end
