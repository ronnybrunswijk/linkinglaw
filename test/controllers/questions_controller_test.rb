require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
    include Devise::TestHelpers

    test "post valid question" do
        post :preview, question: { title: 'a', description: 'a' }
        assert_template :preview
        assert assigns(:question)
    end

    test "post question title and description too short" do
        post :preview, question: { title: '', description: '' }
        assert_template :new
        question =  assigns(:question)
        refute question.valid?
        assert_equal 2, question.errors.count
        assert_equal "is te kort (minimaal 1 teken)", question.errors[:title].first
        assert_equal "is te kort (minimaal 1 teken)", question.errors[:description].first
    end

    test "post question title and description too long" do
            post :preview, question: { title: 'a' * 101 , description: 'a' * 501 }
            assert_template :new
            question =  assigns(:question)
            refute question.valid?
            assert_equal 2, question.errors.count
            assert_equal "is te lang (maximaal 100 tekens)", question.errors[:title].first
            assert_equal "is te lang (maximaal 500 tekens)", question.errors[:description].first
     end
end
