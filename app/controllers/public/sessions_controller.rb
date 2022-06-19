# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
 before_action :user_state, only: [:create]

   def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to posts_path, notice: 'ゲストユーザーとしてログインしました。'
   end
  def user_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @user = User.find_by(email: params[:user][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@user
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @user.valid_password?(params[:user][:password])
      ## 【処理内容3】
      if @user.is_active == true
        render action: :create
      elsif @user.is_active == false
        flash[:alert] = 'このユーザーは退会済みです。申し訳ございませんが、別のメールアドレスをお使いください。'
        redirect_to  new_user_registration_path
      end
    end
  end
end
