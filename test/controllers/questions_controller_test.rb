require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
    include Devise::TestHelpers

    test "post valid question" do
        post :preview, question: { title: 'a', description: 'a' }
        assert_template :preview
        assert assigns(:question)
    end

    test "post invalid question" do
        post :preview, question: { title: '', description: '' }
        assert_template :new
        question =  assigns(:question)
        refute question.valid?
        assert_equal 2, question.errors.count
    end
 
end
