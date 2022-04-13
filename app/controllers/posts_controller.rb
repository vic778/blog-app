class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts.order(created_at: :desc)
  end

  def new
    @post = current_user.posts.build
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments.all
    @likes = @post.likes.all
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_posts_url(current_user, @posts)
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
