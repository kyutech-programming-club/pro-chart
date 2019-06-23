class ApplicationController < ActionController::Base
  include SessionsHelper

  add_flash_types :success, :info, :warning, :danger

  def authenticate_user
    if current_user == nil
      redirect_to login_path, danger: "ログインしてください"
    end
  end

  def recomend_user
    if current_user == nil
      redirect_to login_path, info: "登録するにはメンバーになりましょう！！"
    end
  end

  def admin_user
    if current_user.admin == false
      redirect_to root_path, danger: "管理者ではありません"
    end
  end
end