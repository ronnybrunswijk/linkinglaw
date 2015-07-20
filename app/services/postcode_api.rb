require 'httparty'

class PostcodeAPI
    include HTTParty
    base_uri 'http://api.postcodeapi.nu'
    
    def api_key
        ENV['POSTCODE_API_API_KEY'] 
    end
    
    def get_full_address(zip_code)
        # TODO postcode sanitize en validere
        response = self.class.get("/#{zip_code}", headers: {"Api-Key" => api_key})
        if response.success?
            # TODO response noch transformere hjir
            response
        else
            # TODO statusses 401, 404 en 500 afhandelje 
            # By alle fout statussen moate strjitte en plak fjilden enable wurde sadat adfokaat fjirder kin
            # Fout moat fjirder logt wurde fansels
            raise response.response
        end
    end
end