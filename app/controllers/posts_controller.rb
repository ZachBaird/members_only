class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @posts = Post.all
  end

  def new; end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    return unless @post.save

    redirect_to posts_path
  end

  private

  def post_params
    params.permit(:title, :body)
  end
end
