require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
    include Devise::TestHelpers

    def setup
        DatabaseCleaner.start
        @lawyer = FactoryGirl.create(:user, :lawyer)
        sign_in @lawyer
    end

    def teardown 
        DatabaseCleaner.clean    
    end

    test 'lawyer adds practice area to his profile' do
        
    end

end
