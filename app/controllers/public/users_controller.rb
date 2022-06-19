class Public::UsersController < ApplicationController
  def index
    @users = User.only_active.page(params[:page]).per(10)
  end


  def show
    @user = User.find(params[:id])
    all_posts = @user.posts.published.page(params[:page]).per(8)
    gon.posts = all_posts
    posts_count = @user.posts.published.all
    @posts = all_posts
    @all_posts_count = posts_count.count
  end

  def edit
    @user = User.find(params[:id])
  end

   def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
   end

  def confirm
    @user = User.find(current_user.id)
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.is_active = false
    @user.update(user_params)
    reset_session
    redirect_to root_path
  end


   private
  def user_params
    params.permit(:first_name, :last_name, :first_name_kana, :last_name_kana,:is_active, :email)
  end
  def post_params
  params.require(:post).permit(:user_id, :title, :body, :status, :category_id, :address, :review, :experience_at, images_images: [])
  end

end
