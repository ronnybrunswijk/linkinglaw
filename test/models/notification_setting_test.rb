# == Schema Information
#
# Table name: notification_settings
#
#  id                 :integer          not null, primary key
#  created_at         :datetime
#  updated_at         :datetime
#  user_id            :integer
#  next_point_in_time :datetime
#  interval_id        :integer
#
# Indexes
#
#  index_notification_settings_on_interval_id  (interval_id)
#  index_notification_settings_on_user_id      (user_id)
#

require 'test_helper'

class NotificationSettingTest < ActiveSupport::TestCase

  def setup
     DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  test 'interval association' do
      notification_setting = FactoryGirl.create(:notification_setting)
      refute_nil notification_setting.interval
  end 
  
  test 'select lawyers to notify periodically' do
    
    FactoryGirl.create(:lawyer)
    FactoryGirl.create(:lawyer, :with_daily_notification)
    
    lawyers = NotificationSetting.select_lawyers_to_notify_periodically()
    
    assert_equal 1, lawyers.size
    refute_nil lawyers[0].notification_setting.next_point_in_time    

  end

  test 'update next point in time for notification setting with daily interval' do
    
    notification_setting = FactoryGirl.create(:notification_setting, :with_daily_interval)
    old_next_point_in_time = notification_setting.next_point_in_time
    
    notification_setting.update_next_point_in_time
    
    new_next_point_in_time = notification_setting.next_point_in_time
    
    assert_equal old_next_point_in_time + 24.hours, new_next_point_in_time
    
  end
  
  test 'province association' do
    
    notification_setting = FactoryGirl.create(:notification_setting, :with_friesland_region)
    
    assert_equal 1, notification_setting.provinces.size
    assert_equal "Friesland", notification_setting.provinces[0].name

  end

  test 'practice area association' do
    
    notification_setting = FactoryGirl.create(:notification_setting, :with_aansprakelijkheidsrecht)
    
    assert_equal 1, notification_setting.practice_areas.size
    assert_equal "Aansprakelijkheidsrecht", notification_setting.practice_areas[0].name

  end

  #############################################################################################
  #
  # BEGINNING: QUESTION SELECTION BASED ON CONSTRAINTS DEFINED ON NOTIFICATION SETTING
  #
  # Scenario's:
  # 1. Selection with/without time set
  #   a. without region and practice area set
  #   b. with region and without practice area set 
  #   c. with practice area and without region set
  #   d. with region and pracitce area set
  #
  test 'select questions by notification settings: none' do
    
    notification_setting = FactoryGirl.create(:notification_setting, :without_region_and_practice_area)
    create_questions_for_test
    
    include_interval = false
    actual_questions = notification_setting.select_questions(include_interval)
    
    # everything should be found, but no more than 10
    assert_equal 10, actual_questions.size
    # result should be ordered by date in descending order
    # 6 questions created instances ago and 4 of them 25 hours ago
    assert_equal 6, actual_questions.select { |q| q.created_at > DateTime.current - 1.hours}.size
    assert_equal 4, actual_questions.select { |q| q.created_at < DateTime.current - 1.hours}.size    
  end

  test 'select questions by notification settings: aansprakelijkheidsrecht practice area' do
    
    create_questions_for_test
    notification_setting = FactoryGirl.create(:notification_setting)    
    notification_setting.practice_areas = [@practice_area_aansprakelijkheidsrecht]
    
    include_interval = false
    actual_questions = notification_setting.select_questions(include_interval)
    
    # only questions with aansprakelijkheidsrecht as subject should appear in selection
    assert_equal 4, actual_questions.size
    actual_questions.each do |question| 
      assert_equal @practice_area_aansprakelijkheidsrecht, question.practice_area
    end
    
  end

  test 'select questions by notification settings: Limburg province' do
    
    create_questions_for_test
    notification_setting = FactoryGirl.create(:notification_setting)    
    notification_setting.provinces = [@province_limburg]
    
    include_interval = false
    actual_questions = notification_setting.select_questions(include_interval)
    
    # only questions with limburg as region should appear in selection    
    assert_equal 4, actual_questions.size
    actual_questions.each do |question|
      assert_equal @province_limburg, question.province
    end
    
  end

  test 'select questions by notification setting: aansprakelijkheidsrecht practice area and Limburg province' do
    
    create_questions_for_test
    notification_setting = FactoryGirl.create(:notification_setting)    
    notification_setting.provinces = [@province_limburg]
    notification_setting.practice_areas = [@practice_area_aansprakelijkheidsrecht]    
    
    include_interval = false
    actual_questions = notification_setting.select_questions(include_interval)
    
    assert_equal 2, actual_questions.size
    actual_questions.each do |question|
      assert_equal @province_limburg, question.province
      assert_equal @practice_area_aansprakelijkheidsrecht, question.practice_area
    end
    
  end

  test 'select questions by notificationsetting: daily interval' do

    create_questions_for_test
    notification_setting = FactoryGirl.create(:notification_setting, 
                                              :with_daily_interval, 
                                              :without_region_and_practice_area)

    include_interval = true
    actual_questions = notification_setting.select_questions(include_interval)
    
    assert_equal 6, actual_questions.size

  end

  test 'select questions by notification settings: daily interval and aansprakelijkheidsrecht practice area' do

    create_questions_for_test
    notification_setting = FactoryGirl.create(:notification_setting, 
                                              :with_daily_interval)
    notification_setting.practice_areas = [@practice_area_aansprakelijkheidsrecht]
    
    include_interval = true
    actual_questions = notification_setting.select_questions(include_interval)
    
    assert_equal 2, actual_questions.size
    actual_questions.each do |question|
      assert_equal @practice_area_aansprakelijkheidsrecht, question.practice_area
    end
  end

  test 'select questions by notification settings: daily interval and Limburg region' do

    create_questions_for_test
    notification_setting = FactoryGirl.create(:notification_setting, 
                                              :with_daily_interval)
    notification_setting.provinces = [@province_limburg]
    
    include_interval = true
    actual_questions = notification_setting.select_questions(include_interval)
    
    assert_equal 2, actual_questions.size
    actual_questions.each do |question|
      assert_equal @province_limburg, question.province
    end
  end

  test 'select questions by notification settings: daily interval, aansprakelijkheidsrecht practice area and Limburg region' do

    create_questions_for_test
    notification_setting = FactoryGirl.create(:notification_setting)    
    notification_setting.provinces = [@province_limburg]
    notification_setting.practice_areas = [@practice_area_aansprakelijkheidsrecht]    

    include_interval = true
    actual_questions = notification_setting.select_questions(include_interval)

    assert_equal 1, actual_questions.size
    assert_equal @province_limburg, actual_questions[0].province
    assert_equal @practice_area_aansprakelijkheidsrecht, actual_questions[0].practice_area

  end

  private
    
    def create_questions_for_test 
      
      # provinces
      @province_limburg = FactoryGirl.create(:limburg)
      province_zeeland = FactoryGirl.create(:zeeland)
      
      # practice areas
      @practice_area_aansprakelijkheidsrecht = FactoryGirl.create(:aansprakelijkheidsrecht)
      practice_area_contractenrecht = FactoryGirl.create(:contractenrecht)
      
      # question from limburg
      question_from_limburg = FactoryGirl.create(:question)
      question_from_limburg.province = @province_limburg
      question_from_limburg.save

      # question with aansprakelijkheidsrecht
      question_with_aansprakelijkheidsrecht = FactoryGirl.create(:question)
      question_with_aansprakelijkheidsrecht.practice_area = @practice_area_aansprakelijkheidsrecht
      question_with_aansprakelijkheidsrecht.save

      # question from limburg with aansprakelijkheidsrecht
      question_from_limburg_with_aansprakelijkheidsrecht = FactoryGirl.create(:question)
      question_from_limburg_with_aansprakelijkheidsrecht.province = @province_limburg
      question_from_limburg_with_aansprakelijkheidsrecht.practice_area = @practice_area_aansprakelijkheidsrecht
      question_from_limburg_with_aansprakelijkheidsrecht.save      

      # question from limburg created 25 hours ago
      question_from_limburg_created_25_hours_ago = FactoryGirl.create(:question, :created_25_hours_ago)
      question_from_limburg_created_25_hours_ago.province = @province_limburg
      question_from_limburg_created_25_hours_ago.save

      # question with aansprakelijkheidsrecht created 25 hours ago
      question_with_aansprakelijkheidsrecht_created_25_hours_ago = FactoryGirl.create(:question, :created_25_hours_ago)
      question_with_aansprakelijkheidsrecht_created_25_hours_ago.practice_area = @practice_area_aansprakelijkheidsrecht
      question_with_aansprakelijkheidsrecht_created_25_hours_ago.save

      # question from limburg with aansprakelijkheidsrecht created 25 hours ago
      question_from_limburg_with_aansprakelijkheidsrecht_created_25_hours_ago = FactoryGirl.create(:question, :created_25_hours_ago)
      question_from_limburg_with_aansprakelijkheidsrecht_created_25_hours_ago.province = @province_limburg
      question_from_limburg_with_aansprakelijkheidsrecht_created_25_hours_ago.practice_area = @practice_area_aansprakelijkheidsrecht
      question_from_limburg_with_aansprakelijkheidsrecht_created_25_hours_ago.save      

      # question from zeeland
      question_from_zeeland = FactoryGirl.create(:question)
      question_from_zeeland.province = province_zeeland
      question_from_zeeland.save

      # question with contractenrecht
      question_with_contractenrecht = FactoryGirl.create(:question)
      question_with_contractenrecht.practice_area = practice_area_contractenrecht
      question_with_contractenrecht.save

      # question from zeeland with contractenrecht
      question_from_zeeland_with_contractenrecht = FactoryGirl.create(:question)
      question_from_zeeland_with_contractenrecht.province = province_zeeland
      question_from_zeeland_with_contractenrecht.practice_area = practice_area_contractenrecht
      question_from_zeeland_with_contractenrecht.save      
      
      # question from zeeland created 25 hours ago
      question_from_zeeland_created_25_hours_ago = FactoryGirl.create(:question, :created_25_hours_ago)
      question_from_zeeland_created_25_hours_ago.province = province_zeeland
      question_from_zeeland_created_25_hours_ago.save

      # question with contractenrecht created 25 hours ago
      question_with_contractenrecht_created_25_hours_ago = FactoryGirl.create(:question, :created_25_hours_ago)
      question_with_contractenrecht_created_25_hours_ago.practice_area = practice_area_contractenrecht
      question_with_contractenrecht_created_25_hours_ago.save

      # question from zeeland with contractenrecht created 25 hours ago
      question_from_zeeland_with_contractenrecht_created_25_hours_ago = FactoryGirl.create(:question, :created_25_hours_ago)
      question_from_zeeland_with_contractenrecht_created_25_hours_ago.province = province_zeeland
      question_from_zeeland_with_contractenrecht_created_25_hours_ago.practice_area = practice_area_contractenrecht
      question_from_zeeland_with_contractenrecht_created_25_hours_ago.save      

      [question_from_limburg,
       question_with_aansprakelijkheidsrecht,
       question_from_limburg_with_aansprakelijkheidsrecht,
       question_from_zeeland,
       question_with_contractenrecht,
       question_from_zeeland_with_contractenrecht,
       question_from_limburg_created_25_hours_ago,
       question_with_aansprakelijkheidsrecht_created_25_hours_ago,
       question_from_limburg_with_aansprakelijkheidsrecht_created_25_hours_ago,
       question_from_zeeland_created_25_hours_ago,
       question_with_contractenrecht_created_25_hours_ago,
       question_from_zeeland_with_contractenrecht_created_25_hours_ago]       
    end
end
