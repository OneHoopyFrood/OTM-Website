class PagesController < ApplicationController
  def home
    @posts = Post.order(created_at: :desc).paginate(page: params[:page], per_page: 4)
  end

  def about
  end

  def map
  end

  def help
  end
end
