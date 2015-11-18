require 'sidekiq/testing'
Sidekiq::Testing.inline!

Before do

    # Forces all threads to share the same connection. This works on
    # Capybara because it starts the web server in a thread.
    ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
    DatabaseCleaner.start
end

After do 
    DatabaseCleaner.clean
end 

Before('@signed_in') do
  @current_user = FactoryGirl.create(:entrepreneur, :with_answered_question)
  visit '/users/sign_in'
  fill_in "user_email", with: @current_user.email
  fill_in "user_password", with: @current_user.password
  click_button I18n.t(:sign_in, scope: [:devise, :sessions])
end

Before('@signed_in_lawyer') do
  @current_user = FactoryGirl.create(:lawyer)
  visit '/users/sign_in'
  fill_in "user_email", with: @current_user.email
  fill_in "user_password", with: @current_user.password
  click_button I18n.t(:sign_in, scope: [:devise, :sessions])
end

Before('@signed_in_lawyer_with_daily_notification') do
  @current_user = FactoryGirl.create(:lawyer, :with_daily_notification)
  visit '/users/sign_in'
  fill_in "user_email", with: @current_user.email
  fill_in "user_password", with: @current_user.password
  click_button I18n.t(:sign_in, scope: [:devise, :sessions])
end

Before('@3_questions') do
  FactoryGirl.create_list(:questions, 3)
end

# Even sjin as dizze not gewoan de current user fan type entrepreneur weze kin.
Before('@entrepreneur_with_questions') do
  @entrepreneur_with_questions = FactoryGirl.create(:entrepreneur, :with_questions)  
end

Before('@seeds') do
  load "#{Rails.root}/features/data/seeds.rb"
end

Before('@question_with_answers') do
  @question_with_answers = FactoryGirl.create(:question, :with_answers)
end

Before('@postcodeapi_stub') do
   response = {success: true, resource: { street: "Broadway", town: "New York"}}
   PostcodeAPI.any_instance.stubs(:get_full_address).with("1000AA").returns(response)  
end

Before('@profiles') do
  Province.delete_all; PracticeArea.delete_all
  @profile_from_friesland_with_aansprakelijkheidsrecht = FactoryGirl.create(:profile, :from_friesland, :with_aansprakelijkheidsrecht)
  @profile_from_groningen_with_arbeids_en_pensioenrecht =FactoryGirl.create(:profile, :from_groningen, :with_arbeids_en_pensioenrecht)
  @profile_from_drenthe_with_contractenrecht = FactoryGirl.create(:profile, :from_drenthe, :with_contractenrecht)
end

Before('@profile_with_reviews') do
  @profile_with_reviews = FactoryGirl.create(:profile, :from_friesland, :with_reviews)
end