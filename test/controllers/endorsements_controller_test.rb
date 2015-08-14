require 'test_helper'

class EndorsementsControllerTest < ActionController::TestCase
    include Devise::TestHelpers

    def setup
         DatabaseCleaner.start
         @request.env['devise.mapping'] = Devise.mappings[:user]
    end

    def teardown 
         DatabaseCleaner.clean    
    end

    test 'endorse question' do

        lawyer = FactoryGirl.create(:lawyer, :abraham_lincoln)
        sign_in lawyer
        
        profile = lawyer.profile
        answer = FactoryGirl.create(:answer)
        assert_empty Endorsement.all
        
        post :create, {answer_id: answer.id}

        endorsement = Endorsement.first
        refute_nil endorsement
        assert_equal profile, endorsement.profile
        assert_equal answer, endorsement.answer
    end
    
    test 'destroy endorsement' do 
       
       endorsement = FactoryGirl.create(:endorsement)
       answer = endorsement.answer
       profile = endorsement.profile
       sign_in User.find(profile.user_id)
       
       delete :destroy, {answer_id: answer.id}

       refute Endorsement.exists?([profile.id, answer.id])   
    end        
    
end