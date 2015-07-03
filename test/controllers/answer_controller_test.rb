require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
    include Devise::TestHelpers

    def setup
         DatabaseCleaner.start
         @lawyer = FactoryGirl.create(:user, :lawyer, :with_profile)
         @entrepreneur = FactoryGirl.create(:user, :entrepreneur, :with_questions)
         @request.env['devise.mapping'] = Devise.mappings[:user]
         sign_in @lawyer
    end

    def teardown 
         DatabaseCleaner.clean    
    end
   
    test 'a lawyer answers a question' do

        text = "well, I've seen some on t.v."
        question = @entrepreneur.questions.first

        assert_empty @lawyer.answers
        assert_empty question.answers

        xhr :post, :create, answer: { text: text,
                                      question_id: question.id}
        
        answered_question = assigns(:question)
        assert_equal question, answered_question
        answer = question.answers.first
        assert_equal text, answer.text
        assert_equal @lawyer, answer.user
        assert_template "user_mailer/notify_entrepreneur" 
        assert_template partial: "answers/_answers_to_question"
    end

    test 'new answer comes with a question' do
           
        question = FactoryGirl.create(:question)
        
        get :new, { question_id: question.id }
        
        assert_template :new   
        refute_nil assigns(:answer)
        assert_equal question, assigns(:question)
    end
    
end