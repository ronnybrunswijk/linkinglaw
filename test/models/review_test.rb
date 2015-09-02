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
#  rating     :float
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
  
  test 'new review has value 0 for rating' do
    review = Review.new
    assert_equal 0, review.rating
  end
  
  test 'calculate rating' do

    profile = FactoryGirl.build(:profile)
    reviews = FactoryGirl.build_list(:review_with_only_body_and_title, 5)
    reviews.each_with_index do |review, index|
      review.rating = index + 0.55
    end
    profile.reviews = reviews
    assert_equal 2.6, profile.calculate_rating
  
  end

  test 'calculate rating when there no reviews' do

    profile = FactoryGirl.build(:profile)
    
    assert_empty profile.reviews
    assert_equal(0, profile.calculate_rating)
  
  end
end
