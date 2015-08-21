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
