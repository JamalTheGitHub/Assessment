class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @posts = Post.all
  end

  private


  def post_params
    params.require(:post).permit(:title, :content)
  end
end
