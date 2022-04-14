class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts.order(created_at: :desc).includes(:comments, :likes)
  end

  def new
    @post = current_user.posts.build
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments, :likes).find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_posts_url(current_user, @posts), notifies: 'Post was successfully created.'
    else
      render 'new', alert: 'Post was not created.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
