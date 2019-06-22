class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to root_path, success: "新規登録に成功しました"
    else
      render :new
      end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.required(:user).permit(:name, :password, :password_confirmation)
  end
end
