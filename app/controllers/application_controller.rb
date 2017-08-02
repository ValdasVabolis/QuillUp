class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_previous_path
    session[:previous_path] = request.referrer
  end

  def redirect_to_previous_path
    redirect_to session.delete(:previous_path)
  end
end
