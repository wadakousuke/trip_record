class Public::GuestsController < ApplicationController
 def new_guest
   user = User.find_or_create_by!(email: 'guest@example.com') do |user|
     user.password = SecureRandom.urlsafe_base64
     # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    user.last_name = "さん"
    user.first_name = "ゲスト"
    user.last_name_kana = ""
    user.first_name_kana = ""
   end

   sign_in user
   redirect_to posts_path, notice: 'ゲストユーザーとしてログインしました。'
 end
end
