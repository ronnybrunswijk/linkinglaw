require 'test_helper'

class NotificationSettingsControllerTest < ActionController::TestCase
    include Devise::TestHelpers

    def setup
         DatabaseCleaner.start
         @lawyer = FactoryGirl.create(:lawyer)
         sign_in @lawyer
    end

    def teardown 
         DatabaseCleaner.clean    
    end


    test 'update notification setting' do

        
        notification_setting = FactoryGirl.create(:notification_setting_empty)
        regularity = FactoryGirl.create(:immediately)
        
        assert_nil notification_setting.regularity
        
        put :update, id: notification_setting.id, notification_setting: {
                                                regularity_id: regularity.id
                                              }
        
        notification_setting.reload
        refute_nil notification_setting.regularity

    end

end