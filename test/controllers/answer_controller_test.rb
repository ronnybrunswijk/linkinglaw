require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
    include Devise::TestHelpers

    def setup
         DatabaseCleaner.start
         @lawyer = FactoryGirl.create(:user, :lawyer, :with_profile)
         @request.env['devise.mapping'] = Devise.mappings[:user]
         sign_in @lawyer
    end

    def teardown 
         DatabaseCleaner.clean    
    end
   
    test 'a lawyer answers a question' do
        question = FactoryGirl.create(:question)

        assert_empty @lawyer.answers
        assert_empty question.answers
        
        post :create, answer: { text: "well, I've seen some on t.v.",
                                question_id: question.id}
        
        answer = assigns(:answer)
        assert_equal @lawyer, answer.user
        assert_equal question, answer.question
    end

    test 'new answer comes with a question' do
        question = FactoryGirl.create(:question)
           
        get :new, { question_id: question.id }
        
        assert_template :new   
        refute_nil assigns(:answer)
        assert_equal question, assigns(:question)
    end
    
end