class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exeption|
    redirect_to root_path, notice: "Вы не авторизированы для доступа к этой части приложения"
  end

end
