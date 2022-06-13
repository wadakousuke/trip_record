class Public::HomesController < ApplicationController
        before_action :authenticate_user!, except: [:top, :about]
  def top
    @posts = Post.order(created_at: :desc).limit(4)
  end

  def about
  end
end
