# == Schema Information
#
# Table name: endorsements
#
#  profile_id :integer
#  answer_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class EndorsementTest < ActiveSupport::TestCase

  def setup
     DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  test 'profile association' do
     endorsement = FactoryGirl.create(:endorsement)
     refute_nil endorsement.profile
  end 

  test 'question association' do
      endorsement = FactoryGirl.create(:endorsement)
      refute_nil endorsement.answer
  end 
end
