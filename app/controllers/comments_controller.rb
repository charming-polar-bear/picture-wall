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

    if comment_deletable?(@comment, current_user)
      @comment.destroy
      redirect_to :back
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end