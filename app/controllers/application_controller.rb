class ApplicationController < ActionController::Base
  include SlackModule
  protect_from_forgery with: :exception

  before_action :set_locale

  def set_previous_path
    session[:previous_path] = request.referrer
  end

  def redirect_to_previous_path
    redirect_to session.delete(:previous_path)
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
