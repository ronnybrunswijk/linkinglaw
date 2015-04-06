# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#
# Indexes
#
#  index_questions_on_user_id  (user_id)
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

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
    params[:title] = "a" 
    question = Question.new params

    refute question.valid?
  end

  test "min length boundary of title" do
    params = valid_params.clone
    params[:title] = "a" * 2
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
    params[:description] = "a"
    question = Question.new params

    refute question.valid?
  end

  test "min length boundary of description" do
    params = valid_params.clone
    params[:description] = "a" * 2
    question = Question.new params

    assert question.valid?
  end

  test "no title present" do
    question = Question.new

    refute question.valid?
  end
end
