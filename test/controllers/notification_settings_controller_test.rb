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


    test 'update notification setting with future notification time and daily interval' do
        
        notification_setting = FactoryGirl.create(:notification_setting_empty)
        interval = FactoryGirl.create(:daily)
        
        assert_nil notification_setting.interval
        
        point_in_time = DateTime.current 
        put :update, id: notification_setting.id, notification_setting: {
                                                "next_notification_time(1i)" => point_in_time.year,
                                                "next_notification_time(2i)" => point_in_time.month,                                                
                                                "next_notification_time(3i)" => point_in_time.day,                                                
                                                "next_notification_time(4i)" => point_in_time.hour,
                                                "next_notification_time(5i)" => "52",                                                                                                                                               
                                                interval_id: interval.id
                                              }
        
        notification_setting.reload
        refute_nil notification_setting.interval
        assert_equal interval, notification_setting.interval
        date_format = "%Y-%m-%d %H:%M"
        assert_equal point_in_time.beginning_of_hour.strftime(date_format), notification_setting.next_notification_time.strftime(date_format)
        
    end

    test 'update notification setting with passed notification time and daily interval' do
        
        notification_setting = FactoryGirl.create(:notification_setting_empty)
        interval = FactoryGirl.create(:daily)
        
        assert_nil notification_setting.interval
        
        point_in_time = DateTime.current - 8.hours
        put :update, id: notification_setting.id, notification_setting: {
                                                "next_notification_time(1i)" => point_in_time.year,
                                                "next_notification_time(2i)" => point_in_time.month,                                                
                                                "next_notification_time(3i)" => point_in_time.day,                                                
                                                "next_notification_time(4i)" => point_in_time.hour,
                                                "next_notification_time(5i)" => "35",                                                                                               
                                                interval_id: interval.id
                                              }
        
        notification_setting.reload
        assert_equal interval, notification_setting.interval
        date_format = "%Y-%m-%d %H:%M"
        assert_equal (point_in_time.beginning_of_hour + 24.hours).strftime(date_format), notification_setting.next_notification_time.strftime(date_format)
        
    end
    
    test 'update notification setting with immediate interval' do
       
       notification_setting = FactoryGirl.create(:notification_setting, :with_daily_interval)
       refute_nil notification_setting.next_notification_time
   
       interval = FactoryGirl.create(:immediately)
       
       put :update, id: notification_setting.id, notification_setting: {
                                                interval_id: interval.id
                                              }
        
       notification_setting.reload
       
       assert_equal interval, notification_setting.interval
       assert_nil notification_setting.next_notification_time
        
    end
    
    test 'update region settings' do
        
        notification_setting = FactoryGirl.create(:notification_setting)        
        regions = [FactoryGirl.create(:friesland),
                   FactoryGirl.create(:groningen)]
                   
       put :update, id: notification_setting.id, notification_setting: {
                                                province_ids: regions.map(&:id)
                                              }
        
       notification_setting.reload
       
       assert_equal regions, notification_setting.provinces

    end

    test 'update practice area settings' do
        
        notification_setting = FactoryGirl.create(:notification_setting)        
        practice_areas = [FactoryGirl.create(:aansprakelijkheidsrecht),
                   FactoryGirl.create(:contractenrecht)]
                   
       put :update, id: notification_setting.id, notification_setting: {
                                                practice_area_ids: practice_areas.map(&:id)
                                              }
        
       notification_setting.reload
       
       assert_equal practice_areas, notification_setting.practice_areas

    end

end