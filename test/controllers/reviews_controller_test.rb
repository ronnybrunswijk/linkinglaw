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
        
        get :new
        
        review = assigns(:review)
        refute_nil review
    end

    test 'entrepreneur reviews a lawyer' do
    
        entrepreneur = FactoryGirl.create(:entrepreneur)
        profile = FactoryGirl.create(:profile)
        sign_in entrepreneur
        title = "title"
        body = "body"
        
        assert_empty Review.all
        
        post :create, review: { title: title,
                                body: body,
                                profile_id: profile.id}

        review = Review.first
        refute_nil review
        assert_equal title, review.title
        assert_equal body, review.body
        assert_equal profile, review.profile
        assert_equal entrepreneur, review.user
    end
end