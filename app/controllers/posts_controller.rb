class PostsController < ApplicationController
  before_action :authorized_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = "Post successful!"
      redirect_to edit_post_path(@post)
    else
      flash[:error] = "Unable to create post"
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to edit_post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted"
    redirect_to root_url
  end

  private

    def post_params
      params.require(:post).permit(:body, :title)
    end

    # Confirms access is by authed user
    def authorized_user
      @user = Post.find(params[:id]).user
      redirect_to(root_url) unless logged_in? && (current_user?(@user) || current_user.admin?)
    end

end
