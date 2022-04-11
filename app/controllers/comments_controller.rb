class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    @post = Post.find(comment_params[:post_id])

    if @comment.save
      flash[:notice] = 'Comment has been created successfully'
      redirect_to user_post_path @post, notice: 'Comment has been created successfully.'
    else
      flash[:alert] = 'Adding a comment failed.'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :text)
  end
end
