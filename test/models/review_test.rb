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
  
  test 'calculate rating' do

    profile = FactoryGirl.build(:profile)
    reviews = FactoryGirl.build_list(:review_with_only_body_and_title, 5)
    reviews.each_with_index do |review, index|
      review.rating = index + 0.55
    end
    profile.reviews = reviews
    
    assert_equal 2.6, profile.calculate_rating
  
  end

  test 'calculate rating when there are no reviews' do

    profile = FactoryGirl.build(:profile)
    
    assert_empty profile.reviews
    assert_equal(0, profile.calculate_rating)
  
  end

  test 'calculate rating when there are reviews with and without a rating' do

    profile = FactoryGirl.build(:profile)
    reviews = FactoryGirl.build_list(:review_with_only_body_and_title, 3)
    reviews.each do |review|
      assert_nil review.rating
    end
    
    reviews[0].rating =  4.3
    reviews[2].rating = 1.7
    
    profile.reviews = reviews
    
    assert_equal 3, profile.calculate_rating
  
  end
  
end
