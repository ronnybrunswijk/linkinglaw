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
    question = FactoryGirl.create(:question, :with_aansprakelijkheidsrecht)
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

  ######################################################################################
  # SCENARIOS FOR QUERIES WITH IMMEDIATE INTERVAL
  #
  # Scenario 1: question from specific region (Zeeland)
  #     outcome: selected lawyers should have included 'Zeeland' in their region settings 
  #              and have their interval set to immediately (hours => 0)
  #
  # Scenario 2: question from specific region (Zeeland) and a specific practice area (aansprakelijkheidsrecht)
  #     outcome: selected lawyers should have included 'Zeeland' in their region settings 
  #              and have 'aansprakelijkheidsrecht' included in their practice area settings
  #              and have their interval set to immediately (hours => 0)
  #
  test 'select lawyers to notify for question from specific region immediately' do

    question = FactoryGirl.create(:question, :from_zeeland)
  
    lawyer = FactoryGirl.create(:lawyer)
    lawyer.notification_setting.provinces = [question.province]
    lawyer.save
    # create some extra lawyers that shouldn't appear in selection
    create_lawyers_without_immediate_interval_zeeland_region_and_aansprakelijkheidrecht()
  
    actual_lawyers = question.select_lawyers_to_notify_immediately()
    
    assert_equal [lawyer], actual_lawyers

  end
  
  test 'select lawyers to notify immediately for question about specific practice area and from specific region' do

    question = FactoryGirl.create(:question, :from_zeeland, :with_aansprakelijkheidsrecht)
  
    lawyer = FactoryGirl.create(:lawyer)
    lawyer.notification_setting.provinces = [question.province]
    lawyer.notification_setting.practice_areas = [question.practice_area]
    lawyer.save
    # create some extra lawyers that shouldn't appear in selection
    create_lawyers_without_immediate_interval_zeeland_region_and_aansprakelijkheidrecht()
    
    lawyer_with_zeeland_region = FactoryGirl.create(:lawyer)
    lawyer_with_zeeland_region.notification_setting.provinces = [question.province]
    lawyer_with_zeeland_region.save
    
    lawyer_with_aansprakelijkheidsrecht = FactoryGirl.create(:lawyer)
    lawyer_with_aansprakelijkheidsrecht.notification_setting.practice_areas = [question.practice_area]
    lawyer_with_aansprakelijkheidsrecht.save

    actual_lawyers = question.select_lawyers_to_notify_immediately()
    
    assert_equal [lawyer], actual_lawyers

  end  
  
  private 

    def create_lawyers_without_immediate_interval_zeeland_region_and_aansprakelijkheidrecht
      FactoryGirl.create(:lawyer, :with_daily_notification)
      FactoryGirl.create(:lawyer, :without_notification)    
      FactoryGirl.create(:lawyer, :with_friesland_region)
      FactoryGirl.create(:lawyer, :with_contractenrecht)
    end
  #
  # END SCENARIOS FOR QUERIES WITH IMMEDIATE INTERVAL
  #################################################################
  
  
end
