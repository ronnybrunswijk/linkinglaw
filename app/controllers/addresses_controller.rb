class AddressesController < ApplicationController
   
   def full
        postcodeapi_client = PostcodeAPI.new
        address = postcodeapi_client.get_full_address(params[:zip_code])
        render json: address
   end
    
end