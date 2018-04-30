class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def check_if_admin
    if !current_user.admin?
      redirect_to root_path, :flash => { :error => "У Вас нет прав администратора!" }
    end
  end
end
