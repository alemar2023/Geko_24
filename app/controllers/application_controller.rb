class ApplicationController < ActionController::Base

  DEFAULT_LOCALE = 'en'.freeze

  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :user_role_id])
  end

  def after_sign_in_path_for(resource)
    user_path(current_user) # your path
  end

  protected

  def set_locale
    loc = current_user.locale if user_signed_in?
    loc = params[:locale] if params[:locale]
    loc = (locale_from_cookie_header || I18n.default_locale) unless loc
    I18n.locale = loc
    cookies.permanent[:locale] = I18n.locale
  end

  def locale_from_cookie_header
    cookie_locale = cookies.permanent[:locale]
    available_locales = I18n.available_locales.map(&:to_s)
    if available_locales.include?(cookie_locale)
      cookie_locale
    else
      browser_locale = request.env.fetch('HTTP_ACCEPT_LANGUAGE', '').scan(/[a-z]{2}/).first
      if available_locales.include?(browser_locale)
        browser_locale
      else
        DEFAULT_LOCALE
      end
    end
  end

end
