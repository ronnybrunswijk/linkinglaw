# == Schema Information
#
# Table name: questions
#
#  id               :integer          not null, primary key
#  title            :string(255)
#  description      :text
#  created_at       :datetime
#  updated_at       :datetime
#  user_id          :integer
#  practice_area_id :integer
#
# Indexes
#
#  index_questions_on_practice_area_id  (practice_area_id)
#  index_questions_on_user_id           (user_id)
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  def setup
     DatabaseCleaner.start
     @question = FactoryGirl.create(:question)
  end

  def teardown
    DatabaseCleaner.clean
  end

  def valid_params
    { title: "title", description: "description" }
  end

  test "valid question" do
    question = Question.new valid_params
    assert question.valid?
  end

  test "max length check for title that's too long" do
    params = valid_params.clone
    params[:title] = "a" * 101
    question = Question.new params

    refute question.valid?
  end 

  test "max length boundary of title" do
    params = valid_params.clone
    params[:title] = "a" * 100
    question = Question.new params

    assert question.valid?
  end

  test "min length check for title that's too small" do
    params = valid_params.clone
    params[:title] = "" 
    question = Question.new params

    refute question.valid?
  end

  test "min length boundary of title" do
    params = valid_params.clone
    params[:title] = "a"
    question = Question.new params

    assert question.valid?
  end

  test "max length check for description that's too long" do
    params = valid_params.clone
    params[:description] = "a" * 501
    question = Question.new params

    refute question.valid?
  end

  test "max length boundary of description" do
    params = valid_params.clone
    params[:description] = "a" * 500
    question = Question.new params

    assert question.valid?
  end

  test "min length check for description that's too small" do
    params = valid_params.clone
    params[:description] = ""
    question = Question.new params

    refute question.valid?
  end

  test "min length boundary of description" do
    params = valid_params.clone
    params[:description] = "a"
    question = Question.new params

    assert question.valid?
  end

  test "no title present" do
    question = Question.new

    refute question.valid?
  end
  
  test 'practice area association' do
    assert_not_nil @question.practice_area  
  end

  test 'answer association' do
    question = FactoryGirl.create(:question, :with_answers)
    refute_empty question.answers
    assert question.answers.size > 1
  end 

end
