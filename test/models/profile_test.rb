# == Schema Information
#
# Table name: profiles
#
#  id                       :integer          not null, primary key
#  created_at               :datetime
#  updated_at               :datetime
#  user_id                  :integer
#  first_name               :string(255)
#  last_name                :string(255)
#  phone                    :string(255)
#  profession               :string(255)
#  disciplinary_decision    :boolean
#  years_of_work_experience :integer
#  chamber_of_commerce_no   :string(255)
#  avatar_url               :string(255)
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase

  def setup
     DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  test 'association with practice areas' do
      profile = FactoryGirl.create(:profile, :with_2_practice_areas)
      assert_equal 2, profile.practice_areas.size
  end 
  
  test 'address association' do
      profile = FactoryGirl.create(:profile, :with_2_practice_areas)    
      refute_nil profile.address
  end 

  test 'search a lawyer without specifying search criteria' do
    
    expected_profiles = FactoryGirl.create_list(:profile, 3)
    
    criteria = {}

    actual_profiles = Profile.retrieve(criteria)
    
    refute_empty actual_profiles
    assert_equal expected_profiles, actual_profiles
    
  end

  test 'search a lawyer by practice area' do
      
      FactoryGirl.create(:profile, :with_aansprakelijkheidsrecht)
      expected_profile = FactoryGirl.create(:profile, :with_contractenrecht)
    
      criteria = {practice_area_id: expected_profile.practice_areas.first.id}
      
      actual_profiles = Profile.retrieve(criteria)
      
      refute_empty actual_profiles
      assert_equal [expected_profile], actual_profiles  
  end

  
  test 'search a lawyer by region' do
      
      FactoryGirl.create(:profile, :from_drenthe)
      expected_profile = FactoryGirl.create(:profile, :from_groningen)
    
      criteria = {province_id: expected_profile.address.province_id}
      
      actual_profiles = Profile.retrieve(criteria)
      
      refute_empty actual_profiles
      assert_equal [expected_profile], actual_profiles 
  end
  
  test 'search a lawyer by region and practice area' do

      FactoryGirl.create(:profile, :from_drenthe, :with_contractenrecht)
      expected_profile = FactoryGirl.create(:profile, :from_groningen, :with_aansprakelijkheidsrecht)
    
      criteria = {practice_area_id: expected_profile.practice_areas.first.id,
                  province_id: expected_profile.address.province_id}

      actual_profiles = Profile.retrieve(criteria)
      
      refute_empty actual_profiles
      assert_equal [expected_profile], actual_profiles.sort 
    
  end
  
end
