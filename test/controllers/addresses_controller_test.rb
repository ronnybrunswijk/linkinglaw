require 'test_helper'

class AddressesControllerTest < ActionController::TestCase
    include Devise::TestHelpers

    test 'get full address' do
       PostcodeAPI.any_instance.stubs(:get_full_address).with("1000AA").returns({street: "Broadway", city: "New York"})

       get :full, {zip_code: "1000AA" }
       json = JSON.parse(response.body)
       
       assert_equal "New York", json['city']
       assert_equal "Broadway", json['street']
    end

end