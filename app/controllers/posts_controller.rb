class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.posts.order(created_at: :asc)
  end
  def show
    @post = current_user.posts.find(params[:id])
  end
  def new

  end
  def create
    @post = Post.new(
      title: params[:title],
      content: params[:content],
      category: params[:category],
      user_id: current_user.id
    )
    @post.save
    redirect_to(posts_path)
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.category = params[:category]
    @post.save
    redirect_to(posts_path)
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to(posts_path)
  end
end
