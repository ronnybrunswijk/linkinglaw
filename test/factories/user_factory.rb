# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  role                   :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryGirl.define do

   # Entrepreneur factory
   factory :entrepreneur, class: User do
        name "Joe Louis"
        email "joe.louis@boxing.ko"
        password "righthook"
        password_confirmation "righthook"
        confirmed_at DateTime.current
        role 0

        trait :with_questions do
            after(:create) do |user|
                FactoryGirl.create_list(:questions, 2, user: user)
            end
        end

        trait :with_answered_question do
            after(:create) do |user|
                FactoryGirl.create(:question, :with_answers, user: user)
            end
        end
   end
   
   # Lawyer factory
   factory :lawyer, class: User do
        name "Jack Dempsey"
        sequence(:email) {|n| "jack.dempsey@boxing.ko#{n}"}
        password "lefthook"
        password_confirmation "lefthook"
        confirmed_at DateTime.current
        role 1
        profile { FactoryGirl.create(:profile, :from_friesland) }                
        notification_setting { FactoryGirl.create(:notification_setting) }

        trait :abraham_lincoln do
            email "abraham.lincoln@usa.com"
            role 1
            profile { FactoryGirl.create(:profile) }            
        end

        trait :with_answers do
            after(:create) do |user|
                FactoryGirl.create_list(:answer, 2, user: user)
            end
        end
        
        trait :with_daily_notification do
            notification_setting {FactoryGirl.create(:notification_setting, :with_daily_interval) }            
        end
        
        trait :without_notification do
            notification_setting {FactoryGirl.create(:notification_setting, :with_no_interval) }                        
        end
    end   

    # Admin factory
    factory :admin, class: User do
        name "Edgser Dijkstra"
        email "edgser.dijkstra@bit.com"        
        password "algoritme"
        password_confirmation "algoritme"
        confirmed_at DateTime.current
        role 2
    end
   
end
