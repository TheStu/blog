class StaticsController < ApplicationController
  def home
    @posts = Post.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
  end

  def about
  end
end
