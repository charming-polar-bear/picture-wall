class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :current_user_like, :current_user_dislike]
  before_action :get_post, only: [:show, :destroy, :current_user_like, :current_user_dislike]

  def index
    @posts = Post.includes(:user).all.recent
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
      flash[:warning] = '只能上传jpeg, jpg, png的图片'
    end
  end

  def show
    @comments = @post.comments
    @comment = Comment.new
  end

  def destroy
    if current_user == @post.user || current_user.is_actived_admin
      @post.destroy
      redirect_to '/'
    else
       render :back, notice: '你没有删除的权限哦'
    end
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
