class Public::PostsController < ApplicationController
  def index
    @tag_list = Tag.all
    @categories = Category.all
    if params[:category_id]
      @category = @categories.find(params[:category_id])
      all_posts = @category.posts
    elsif params[:tag_id]
      @tag = @tag_list.find(params[:tag_id])
      all_posts = @tag.posts
    else
      all_posts = Post.all

    end
    @posts = all_posts
    @all_posts_count = all_posts.count
  end

  def edit
     @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])  #クリックした投稿を取得。
    @post_tags = @post.tags
    gon.post = @post
  end

  def update
    @post = Post.find(params[:id])
    @post.update
    redirect_to post_path(@post)
  end


private
def post_params
  params.require(:post).permit(:user_id, :title, :body, :category_id, :address, :review, :experience_at, images_images: [])
end
def tag_params
  params.require(:tag).permit(:name)
end
end
class Admin::PostsController < ApplicationController
  def index
  end

  def edit
  end

  def show
  end
end
