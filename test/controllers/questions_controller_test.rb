require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
    include Devise::TestHelpers

     def setup
         DatabaseCleaner.start
         @entrepreneur_with_2_questions = FactoryGirl.create(:entrepreneur_with_2_questions)
         @entrepreneur_with_1_question = FactoryGirl.create(:entrepreneur_with_1_question)
         @request.env['devise.mapping'] = Devise.mappings[:user]
         sign_in @entrepreneur_with_2_questions
    end

    def test_post_valid_question
        post :preview, question: { title: 'a', description: 'a' }

        assert_template :preview
        assert assigns(:question)
    end

    def test_post_question_title_and_description_too_short
        post :preview, question: { title: '', description: '' }
        assert_template :new
        question =  assigns(:question)

        refute question.valid?
        assert_equal 2, question.errors.count
        assert_equal "is te kort (minimaal 1 teken)", question.errors[:title].first
        assert_equal "is te kort (minimaal 1 teken)", question.errors[:description].first
    end

    def test_post_question_title_and_description_too_long
        post :preview, question: { title: 'a' * 101 , description: 'a' * 501 }
        assert_template :new
        question =  assigns(:question)

        refute question.valid?
        assert_equal 2, question.errors.count
        assert_equal "is te lang (maximaal 100 tekens)", question.errors[:title].first
        assert_equal "is te lang (maximaal 500 tekens)", question.errors[:description].first
    end

    def test_list_questions_entrepreneur
        get :index
        assert_response :success
        expected_questions = @entrepreneur_with_2_questions.questions
        actual_questions = assigns(:questions)
        assert_not_nil actual_questions
        assert_equal expected_questions.count, actual_questions.count
        assert_includes expected_questions, actual_questions[0]
        assert_includes expected_questions, actual_questions[1]
    end
end
