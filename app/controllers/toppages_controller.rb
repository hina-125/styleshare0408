class ToppagesController < ApplicationController

  def index
    if logged_in?
      @post = current_user.posts.build  # form_with 用
      @posts = current_user.posts.order(id: :desc).page(params[:page])
    end
  end
end
# if logged_in?〜１個目のendまでを追記（Chapter 9.3）
# toppages#index にpostの一覧を表示