class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  include DeviseHelper

  def set_locale
    I18n.locale = extract_locale_from_tld || I18n.default_locale
  end

  def extract_locale_from_tld
      parsed_locale = request.host.split('.').last
      parsed_locale = "en" if parsed_locale == "com"
      I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  protected

    def entrepreneur_only
      unless current_user.role == "entrepreneur"
          redirect_to root_url, alert: I18n.t(:unauthorized, scope: [:devise, :failure], user_type: current_user.role)
      end
    end
   
    def lawyer_only
      unless current_user.role == "lawyer"
          redirect_to root_url, alert: I18n.t(:unauthorized, scope: [:devise, :failure], user_type: current_user.role)
      end
    end   

end
