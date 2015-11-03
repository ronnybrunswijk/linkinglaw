class RegistrationsController < Devise::RegistrationsController

   def new
      build_resource({})
      if params[:type]
        profile = resource.build_profile
        profile.build_address
      end

      @validatable = devise_mapping.validatable?
      if @validatable
         @minimum_password_length = resource_class.password_length.min
      end

      respond_with self.resource
   end

   def create

      build_resource(sign_up_params)

      # dit ferhuzje nei de new actions en dan net ta stean de role attribuut te upaten ifm admin rol
      if resource.profile
        resource.role = "lawyer"
        address = resource.profile.address
        address.province = ZipCodeRange.find_province(address.zip_code)
        notification_setting = NotificationSetting.new
        notification_setting.regularity = Regularity.find_by(name: "Meteen")
        resource.notification_setting = notification_setting
      end

      if request.xhr?
         resource.skip_confirmation! 
         if resource.save
            if resource.active_for_authentication?
               set_flash_message :notice, :signed_up if is_navigational_format?
               sign_up(resource_name, resource)
               return render :json => {:success => true}
            else
               set_flash_message :notice, :"signed_up_but_inactive" if is_navigational_format?
               expire_session_data_after_sign_in!
               return render :json => {:success => true}
            end
         else
            clean_up_passwords resource
            return render partial:  'devise/shared/errors', status: :unauthorized
         end
      else
         resource_saved = resource.save
         yield resource if block_given?
         if resource_saved
            if resource.active_for_authentication?
               set_flash_message :notice, :signed_up if is_flashing_format?
               sign_up(resource_name, resource)
               respond_with resource, location: after_sign_up_path_for(resource)
            else
               set_flash_message :notice, :signed_up_but_inactive if is_flashing_format?
               expire_data_after_sign_in!
               respond_with resource, location: after_inactive_sign_up_path_for(resource)
            end
         else
            clean_up_passwords resource
            @validatable = devise_mapping.validatable?
            if @validatable
               @minimum_password_length = resource_class.password_length.min
            end
            respond_with resource
         end
      end
   end


  # Signs in a user on sign up. You can overwrite this method in your own
  # RegistrationsController.
  def sign_up(resource_name, resource)
     sign_in(resource_name, resource)
  end

  protected

    def configure_permitted_parameters
       devise_parameter_sanitizer.for(:sign_up) { |user|
          user.permit(:name, :email, :password, :password_confirmation, 
          profile_attributes: [:first_name,
                               :last_name,
                               :business_address,
                               :city,
                               :phone,
                               :profession,
                               :disciplinary_decision,
                               :years_of_work_experience,
                               :chamber_of_commerce_no,
                               address_attributes: [:street,
                                         :housenumber,
                                         :housenumber_suffix,
                                         :city,
                                         :zip_code]])
       }
    end

end
