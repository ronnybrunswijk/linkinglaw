require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
    include Devise::TestHelpers

    def setup
         DatabaseCleaner.start
         @request.env['devise.mapping'] = Devise.mappings[:user]
    end

    def teardown 
         DatabaseCleaner.clean    
    end

    test 'entepreneur enters review page' do

        entrepreneur = FactoryGirl.create(:entrepreneur)
        sign_in entrepreneur
        profile = FactoryGirl.create(:profile)
        
        get :new, {profile_id: profile.id}
        
        review = assigns(:review)
        profile_id = assigns(:profile_id)
        refute_nil review
        assert_equal profile.id.to_s, profile_id
    end

    test 'entrepreneur reviews a lawyer' do
    
        entrepreneur = FactoryGirl.create(:entrepreneur)
        profile = FactoryGirl.create(:profile)
        sign_in entrepreneur
        title = "title"; body = "body"; rating = 4
        
        assert_empty profile.reviews
        
        post :create, review: { title: title,
                                body: body,
                                rating: rating,
                                profile_id: profile.id}

        assert_redirected_to profile_path profile.id
        review = profile.reviews.first
        refute_nil review
        assert_equal title, review.title
        assert_equal body, review.body
        assert_equal rating, review.rating
        assert_equal profile, review.profile
        assert_equal entrepreneur, review.user
    end
end