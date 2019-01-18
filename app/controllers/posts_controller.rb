class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @post = Post.find_by(user_id: params[:id])
  end

  private


  def post_params
    params.require(:post).permit(:title, :content)
  end
end
