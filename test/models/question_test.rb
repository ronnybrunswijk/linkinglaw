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
#  province_id      :integer
#
# Indexes
#
#  index_questions_on_practice_area_id  (practice_area_id)
#  index_questions_on_province_id       (province_id)
#  index_questions_on_user_id           (user_id)
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  def setup
     DatabaseCleaner.start
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
    question = FactoryGirl.create(:question, :with_practice_area)
    assert_not_nil question.practice_area  
  end

  test 'answer association' do
    question = FactoryGirl.create(:question, :with_answers)
    refute_empty question.answers
    assert question.answers.size > 1
  end 
  
  test 'province association' do
    question = FactoryGirl.create(:question)

    refute_nil question.province
    assert_equal "Friesland", question.province.name
  end

  test 'province association by assignment' do
    question = Question.create(title: "a", description: "a")
    question.province = FactoryGirl.create(:limburg)
    
    refute_nil question.province
    assert_equal "Limburg", question.province.name
  end

  test 'select questions by region' do
      expected_question = FactoryGirl.create(:question, :for_brabos), FactoryGirl.create(:question, :for_limbos)    
      FactoryGirl.create(:question, :for_sealanders)

      regions = Province.where(name: ["Limburg","Noord-Brabant"])
      actual_questions = Question.select_by_regions(regions)    
      assert_equal expected_question.sort, actual_questions.sort
  end
  
  test 'select questions for notification setting with daily interval' do
    
      questions = FactoryGirl.create_list(:questions, 3)
      point_in_time = DateTime.current.beginning_of_hour 

      question1 = questions[0]
      question1.created_at = point_in_time
      question1.save
      
      question2 = questions[1]
      question2.created_at = point_in_time - 24.hours
      question2.save
      
      question3 = questions[2]
      question3.created_at = point_in_time - 25.hours    
      question3.save
      
      notification_setting = FactoryGirl.create(:notification_setting,:with_daily_interval)
      notification_setting.next_point_in_time = point_in_time
      found_questions = Question.select_questions_asked_after(notification_setting)
      
      assert_equal 2, found_questions.size
      assert_equal question1, found_questions[0]
      assert_equal question2, found_questions[1]
      
  end
  
  test 'select question by practice area' do
    

    
  end   

end
