class PostsController < ApplicationController
  before_action :correct_user, only: [:create, :update, :destroy]

  def index
    @user = User.find_by(id: params[:user_id])
    @posts = Post.all
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      respond_to do |format|
        format.html { redirect_to home_path }
        format.js
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    # byebug
    @post = Post.find(params[:id])
    if @post.update(post_params)
        redirect_to user_post_path(@post.user,@post.id)
    else
        render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(@post.user)
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @post = Post.find(params[:id] )
  end

  private


  def post_params
    params.require(:post).permit(:title, :content)
  end
end
