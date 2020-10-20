class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all.order(created_at: :asc)
  end
  def show
    @post = Post.find(params[:id])
  end
  def new

  end
  def create
    @post = Post.new(title: params[:title], content: params[:content])
    @post.save
    redirect_to(posts_path)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save
    redirect_to(posts_path)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to(posts_path)
  end
end
