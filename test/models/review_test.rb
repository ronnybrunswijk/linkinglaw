# == Schema Information
#
# Table name: reviews
#
#  user_id    :integer          primary key
#  profile_id :integer          primary key
#  title      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_reviews_on_profile_id  (profile_id)
#  index_reviews_on_user_id     (user_id)
#

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

  def setup
     DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  test 'profile association' do
     review = FactoryGirl.build(:review)
     refute_nil review.profile
  end 

  test 'question association' do
      review = FactoryGirl.build(:review)
      refute_nil review.user
  end 
end
