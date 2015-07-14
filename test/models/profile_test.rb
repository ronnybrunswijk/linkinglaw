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
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase

  def setup
     DatabaseCleaner.start
     @profile_with_2_practice_areas = FactoryGirl.create(:profile, :with_2_practice_areas)
  end

  def teardown
    DatabaseCleaner.clean
  end

  test 'association with practice areas' do
      assert_equal 2, @profile_with_2_practice_areas.practice_areas.size
  end 
  
  test 'address association' do
      refute_nil @profile_with_2_practice_areas.address
  end 
end
