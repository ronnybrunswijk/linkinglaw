require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
    include Devise::TestHelpers

    def setup
         DatabaseCleaner.start
         @entrepreneur_with_questions = FactoryGirl.create(:entrepreneur, :with_questions)
         @lawyer = FactoryGirl.create(:lawyer)
         @request.env['devise.mapping'] = Devise.mappings[:user]
         sign_in @entrepreneur_with_questions
    end

    def teardown 
         DatabaseCleaner.clean    
    end

    def test_preview_valid_question
        post :preview, question: { title: 'a', description: 'a' }

        assert_template :preview
        assert assigns(:question)
    end

    def test_preview_question_title_and_description_too_short
        post :preview, question: { title: '', description: '' }
        assert_template :new
        question =  assigns(:question)

        refute question.valid?
        assert_equal 2, question.errors.count
        assert_equal "is te kort (minimaal 1 teken)", question.errors[:title].first
        assert_equal "is te kort (minimaal 1 teken)", question.errors[:description].first
    end

    def test_preview_question_title_and_description_too_long
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
        actual_questions = assigns(:questions)
        assert_not_nil actual_questions
        assert_equal @entrepreneur_with_questions.questions.count, actual_questions.count
        actual_questions.each do |question|
           assert_equal @entrepreneur_with_questions, question.user
        end
    end

    def test_lawyer_cannot_create_question
        sign_in @lawyer
        post :create, question: { title: 'a' , description: 'a' }       

        assert_redirected_to root_url
        assert_equal I18n.t(:unauthorized, scope: [:devise, :failure], user_type: @lawyer.role), flash[:alert]
    end
  
    test 'entrepreneur creates question' do 
      title = "You talking to me?"
      practice_area = PracticeArea.create(name: "some name", subject: "some subject")
      provinces = FactoryGirl.create_list(:provinces, 2)
      post :create, { create: 'create',
                      question: { title: title,
                                  description: 'a',
                                  practice_area_id: practice_area.id,                                  
                                  province_ids: provinces.each {|province| province.id}                                   
                                 }
                    }

      assert_template 'user_mailer/confirm_question'
      question = Question.find_by title: title
      assert_not_nil question
      assert_not_nil question.practice_area
      assert_equal practice_area.id, question.practice_area.id
      assert_equal provinces, question.provinces
    end

    test 'entrepreneur modifies question' do
      post :create, question: {title: 'a', description: 'a'}

      assert_template :new
    end
    
    # test to ensure that bug that caused error message, about not being signed in,
    # when trying to modify a question as an anonymous user, is fixed.
    test 'anonymous user tries to modify a question' do
      sign_out @entrepreneur_with_questions
      post :modify, question: {title: 'a', description: 'b'}
      assert_template :new
      question = assigns(:question)
      assert_equal 'a', question.title
      assert_equal 'b', question.description
    end

    def test_list_all_questions_for_signed_in_lawyers
      sign_in @lawyer
      get :list
     
      assert_template :list
      questions = assigns(:questions)
      refute_empty questions
    end

    def test_list_all_questions_is_not_available_for_entrepreneur
        get :list
        
        assert_redirected_to root_path
        assert_equal I18n.t(:unauthorized, scope: [:devise, :failure], user_type: @entrepreneur_with_questions.role), flash[:alert]        
    end
    
    test 'list all questions is not available for anonymous user' do
       sign_out @entrepreneur_with_questions
       get :list
        
       assert_redirected_to '/users/sign_in'
       assert_equal I18n.t(:unauthenticated ,scope: [:devise,:failure]), flash[:alert]
    end

    test 'lawyer can view details of a question' do
       question = Question.first
       sign_in @lawyer
       
       get :show, { id: question.id }
       
       assert :success
       assert_template :show
    end
end
