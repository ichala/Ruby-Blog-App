class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def posts
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:comments)
  end

  def user
    @user = User.find(params[:id])
  end

  def post
    @user = current_user
    @post = Post.find(params[:id])
  end

  def new_post
    @user = current_user
  end

  def addcomment
    @user = current_user
    @post = Post.find(params[:id])
    @comment = current_user.comments.new(text: params[:comment])
    @comment.post_id = @post.id
    @comment.save
    redirect_to "/users/#{current_user.id}/posts/#{@post.id}"
  end

  def addlike
    @user = current_user
    @post = Post.find(params[:id])
    @like = @post.likes.new
    @like.post_id = @post.id
    @like.author_id = @user.id
    @like.save
    redirect_to "/users/#{current_user.id}/posts/#{@post.id}"
  end

  def save_post
    @post = current_user.posts.new(author_id: current_user.id, title: params[:title], text: params[:text])
    @post.likesCounter = 0
    @post.commentsCounter = 0
    if @post.save
      redirect_to "/users/#{current_user.id}/posts"
    else
      render :new_post
    end
  end
end
