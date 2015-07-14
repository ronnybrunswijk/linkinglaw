require 'httparty'

class PostcodeAPI
    include HTTParty
#    base_uri 'http://api.postcodeapi.nu'
    
    def api_key
        ENV['POSTCODE_API_API_KEY'] 
    end
    
    def get_full_address(zip_code)
        response = self.class.get("http://api.postcodeapi.nu/#{zip_code}", headers: {"Api-Key" => api_key})
        if response.success?
            # TODO response noch transformere hjir
            response
        else
            raise response.response
        end
    end
end