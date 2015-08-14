require 'test_helper'

class AnswersHelperTest < ActionView::TestCase
    include AnswersHelper

    def setup
        DatabaseCleaner.start
    end

    def teardown 
        DatabaseCleaner.clean    
    end
    
    test 'answer is not endorsed by current user' do
       current_user = FactoryGirl.create(:lawyer)
       answer = FactoryGirl.create(:answer)
       refute is_endorsed_by_current_user(current_user, answer)
    end

    test 'answer is endorsed by current user' do
       endorsement = FactoryGirl.create(:endorsement)
       current_user = User.find(endorsement.profile.user_id)
       assert is_endorsed_by_current_user(current_user, endorsement.answer)
    end
    
end
