class Admin::UsersController < ApplicationController
     before_action :authenticate_admin!
  def index
    @users = User.page(params[:page]).per(10)

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
    redirect_to admin_users_path
   end

   private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana,:is_active, :email)
  end
end
