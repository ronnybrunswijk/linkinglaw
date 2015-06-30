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
  @current_user = FactoryGirl.create(:user, :entrepreneur, :with_questions)
  visit '/users/sign_in'
  fill_in "user_email", with: @current_user.email
  fill_in "user_password", with: @current_user.password
  click_button I18n.t(:sign_in, scope: [:devise, :sessions])
end

Before('@signed_in_lawyer') do
  @current_user = FactoryGirl.create(:user, :lawyer, :with_profile)
  visit '/users/sign_in'
  fill_in "user_email", with: @current_user.email
  fill_in "user_password", with: @current_user.password
  click_button I18n.t(:sign_in, scope: [:devise, :sessions])
end

Before('@3_questions') do
  FactoryGirl.create_list(:questions, 3)
end

Before('@entrepreneur_with_questions') do
  @entrepreneur_with_questions = FactoryGirl.create(:user, :entrepreneur, :with_questions)  
end

Before('@with_practice_areas') do
  load "#{Rails.root}/db/seeds.rb"
end