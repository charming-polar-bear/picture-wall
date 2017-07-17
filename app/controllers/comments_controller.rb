class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = Post.find(params[:post_id])

    if @comment.save
      redirect_to :back
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if current_user == @comment.user || current_user == @comment.post.user || current_user.is_actived_admin
      @comment.destroy
      redirect_to :back
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
