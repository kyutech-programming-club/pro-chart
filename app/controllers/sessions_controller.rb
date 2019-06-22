class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      log_in user
      redirect_to root_path, success: "ログインに成功しました"
    else
      redirect_to login_path, danger: "ログインに失敗しました"
    end
  end

  def destroy
    log_out
    redirect_to root_path, success: "ログアウトしました"
  end
end
