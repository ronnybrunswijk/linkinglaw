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

   factory :user, class: User do
        name "Joe Louis"
        email "joe.louis@boxing.ko"
        password "righthook"
        password_confirmation "righthook"
        confirmed_at DateTime.now
        
        trait :entrepreneur do
           email "cornelius.vanderbilt@capital.com"
           role 0 
        end
        
        trait :lawyer do 
            email "barack.obama@usa.com"
            role 1
        end 

        trait :abraham_lincoln do
            email "abraham.lincoln@usa.com"
            role 1
        end
        
        trait :admin do
            email "edgser.dijkstra@bit.com"
            role 2
        end 
        
        trait :with_questions do
            after(:create) do |user|
                FactoryGirl.create(:question1, user: user)
                FactoryGirl.create(:question2, user: user)
            end
        end
        
        trait :with_profile do
            profile { FactoryGirl.create(:profile) }
        end 
        
        trait :with_answers do
            after(:create) do |user|
                FactoryGirl.create_list(:answer, 2, user: user)
            end
        end
   end
end
