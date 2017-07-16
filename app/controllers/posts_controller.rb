class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :like_by_current_user, :dislike_by_current_user]
  before_action :get_post, only: [:show, :destroy, :current_user_like, :current_user_dislike]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user

    if @post.save
      redirect_to '/'
    else
      render :new
    end
  end

  def show
    @comments = @post.comments
    @comment = Comment.new

  end

  def destroy
    # if post_deletable?(@post, current_user)
      @post.destroy
      redirect_to '/'
    # else
    #   render :back
    # end
  end

  def current_user_like
    if !@post.is_liked_by?(current_user)
      @post.like_by!(current_user)
    end

    redirect_to post_path(@post)
  end

  def current_user_dislike
    if @post.is_liked_by?(current_user)
      @post.dislike_by!(current_user)
    end

    redirect_to post_path(@post)
  end


  private
    def post_params
      params.require(:post).permit(:picture, :description)
    end

    def get_post
      @post = Post.find(params[:id])
    end

end
