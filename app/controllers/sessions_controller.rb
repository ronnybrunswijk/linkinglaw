class SessionsController < Devise::SessionsController

  after_action :set_csrf_headers, only: :create

  def create 
    puts "stadium 1"
    self.resource = warden.authenticate!(auth_options)
    puts "stadium 2"
    sign_in(resource_name, resource)
    puts "stadium 3"
    if request.xhr?
      puts "stadium 4"
      render json: { success: true, redirect:  ''}, status: 200
    else 
      puts "stadium 5"
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
       {:scope => resource_name, :recall => "#{controller_path}#failure"}
     end
     
     def set_csrf_headers
       if request.xhr?
         response.headers['X-CSRF-Param'] = request_forgery_protection_token
         response.headers['X-CSRF-Token'] = form_authenticity_token
       end
     end
end  
