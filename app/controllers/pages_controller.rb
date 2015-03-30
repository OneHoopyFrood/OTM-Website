class PagesController < ApplicationController
  def home
    @posts = Post.paginate(page: params[:page], per_page: 10)
  end

  def about
  end

  def map
  end

  def help
  end
end
