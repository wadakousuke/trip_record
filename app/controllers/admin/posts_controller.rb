class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    all_posts = Post.page(params[:page]).per(8)
    posts_count = Post.all
    @posts = all_posts
    @all_posts_count = posts_count.count
  end

  def show
    @post = Post.find(params[:id])  #クリックした投稿を取得。
    @post_tags = @post.tags
    gon.post = @post
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path
  end

private
def post_params
  params.require(:post).permit(:user_id, :title, :body, :status, :category_id, :address, :review, :experience_at, images_images: [])
end
def tag_params
  params.require(:tag).permit(:name)
end
end

