class SessionsController < Devise::SessionsController

  after_action :set_csrf_headers, only: :create

  def create 
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    if request.xhr?
      render json: { success: true}, status: 200
    else 
      set_flash_message(:notice, :signed_in) if is_flashing_format?
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    end
  end

  def failure   
    warden.custom_failure!
    render json: { success: false, error: I18n.t("devise.failure.#{env['warden'].message.to_s}") }, status: 401
  end

  protected
  
    def auth_options
       action = request.xhr? ? "#failure" : "#new"
       { scope: resource_name, recall: "#{controller_path}" << action }         
    end
     
    def set_csrf_headers
       if request.xhr?
#  even utkommentarieerd ifm misljearende cucumber test
#         response.headers['X-CSRF-Param'] = request_forgery_protection_token
         response.headers['X-CSRF-Token'] = form_authenticity_token
       end
    end
end  
