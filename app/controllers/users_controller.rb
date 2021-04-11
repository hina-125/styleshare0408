class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  before_action :forbid_login_user, only: [:index]
  
  def index
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(id: :desc).page(params[:page]).per(5)
    
    if @user == current_user
    else
    redirect_to root_url
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
  
  def fobid_login_user
    if @current_user
      flash[:notice]="ログイン中です"
      redirect_to root_url
    end
  end
end
