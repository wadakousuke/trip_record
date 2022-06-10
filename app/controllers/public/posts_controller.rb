class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    tag_list = params[:post][:name].split(nil)
    @latitude = params[:latitude]
    @longitude = params[:longitude]
    @results = Geocoder.search([@latitude, @longitude])
    if @post.save
      @post.save_tag(tag_list)
      redirect_to post_path(@post)
    else
      render:new
    end
  end

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
  def search
    @latitude = params[:latitude]
    @longitude = params[:longitude]
    @results = Geocoder.search([@latitude, @longitude])
  end


private
def post_params
  params.require(:post).permit(:user_id, :title, :body, :category_id, :address, :review, :experience_at, images_images: [])
end
def tag_params
  params.require(:tag).permit(:name)
end
end
