class RegistrationsController < Devise::RegistrationsController
#  respond_to :json

   def create
      puts "stadium 1"
      build_resource(sign_up_params)

      if resource.save
         puts "stadium 2"
         if resource.active_for_authentication?
            puts "stadium 3"
            set_flash_message :notice, :signed_up if is_navigational_format?
            sign_up(resource_name, resource)
            return render :json => {:success => true}
         else
            puts "stadium 4"
            set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
            expire_session_data_after_sign_in!
            return render :json => {:success => true}
         end
       else
          puts "stadium 5"
          clean_up_passwords resource
          return render :json => {:success => false}
       end
   end


  # Signs in a user on sign up. You can overwrite this method in your own
  # RegistrationsController.
  def sign_up(resource_name, resource)
     puts "stadium 6"
     sign_in(resource_name, resource)
  end
end
