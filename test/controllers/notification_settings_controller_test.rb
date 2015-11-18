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


    test 'update notification setting with future next point in time and daily interval' do
        
        notification_setting = FactoryGirl.create(:notification_setting_empty)
        interval = FactoryGirl.create(:daily)
        
        assert_nil notification_setting.interval
        
        point_in_time = DateTime.current
        put :update, id: notification_setting.id, notification_setting: {
                                                "next_point_in_time(1i)" => point_in_time.year,
                                                "next_point_in_time(2i)" => point_in_time.month,                                                
                                                "next_point_in_time(3i)" => point_in_time.day,                                                
                                                "next_point_in_time(4i)" => point_in_time.hour,
                                                "next_point_in_time(5i)" => "52",                                                                                                                                               
                                                interval_id: interval.id
                                              }
        
        notification_setting.reload
        refute_nil notification_setting.interval
        assert_equal interval, notification_setting.interval
        date_format = "%Y-%m-%d %H:%M"
        assert_equal point_in_time.beginning_of_hour.strftime(date_format), notification_setting.next_point_in_time.strftime(date_format)
        
    end

    test 'update notification setting with passed next point in time and daily interval' do
        
        notification_setting = FactoryGirl.create(:notification_setting_empty)
        interval = FactoryGirl.create(:daily)
        
        assert_nil notification_setting.interval
        
        point_in_time = DateTime.current - 8.hours
        put :update, id: notification_setting.id, notification_setting: {
                                                "next_point_in_time(1i)" => point_in_time.year,
                                                "next_point_in_time(2i)" => point_in_time.month,                                                
                                                "next_point_in_time(3i)" => point_in_time.day,                                                
                                                "next_point_in_time(4i)" => point_in_time.hour,
                                                "next_point_in_time(5i)" => "35",                                                                                               
                                                interval_id: interval.id
                                              }
        
        notification_setting.reload
        assert_equal interval, notification_setting.interval
        date_format = "%Y-%m-%d %H:%M"
        assert_equal (point_in_time.beginning_of_hour + 24.hours).strftime(date_format), notification_setting.next_point_in_time.strftime(date_format)
        
    end
    
    test 'update notification setting with immediate interval' do
       
       notification_setting = FactoryGirl.create(:notification_setting, :with_daily_interval)
       refute_nil notification_setting.next_point_in_time
   
       interval = FactoryGirl.create(:immediately)
       
       put :update, id: notification_setting.id, notification_setting: {
                                                interval_id: interval.id
                                              }
        
       notification_setting.reload
       
       assert_equal interval, notification_setting.interval
       assert_nil notification_setting.next_point_in_time
        
    end
    
    
    
end