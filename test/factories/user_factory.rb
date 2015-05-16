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

   factory :entrepreneur_with_1_question, class: User do
        name "Joe Louis"
        email "joe.louis@boxing.ko"
        password "righthook"
        password_confirmation "righthook"
        confirmed_at DateTime.now
        after(:create) do |user|
            FactoryGirl.create(:question1, user: user)
        end
   end

   factory :entrepreneur_with_2_questions, class: User do
        name "Jack Dempsey"
        email "jack.dempsey@boxing.ko"
        password "lefthook"
        password_confirmation "lefthook"
        confirmed_at DateTime.now
        after(:create) do |user|
            FactoryGirl.create(:question2, user: user)
            FactoryGirl.create(:question3, user: user)
        end
   end

   factory :lawyer, class: User do
        name "Barack Obama"
        email "barack.obama@usa.com"
        password "whitehouse"
        password_confirmation "whitehouse"
        confirmed_at DateTime.now
        role 1
   end

   factory :entrepreneur, class: User do
        name "Cornelius Vanderbilt"
        email "connelius.vanderbilt@money.com"
        password "transportation"
        password_confirmation "transportation"
        confirmed_at DateTime.now
        role 0
   end

   factory :admin, class: User do
         name "Edsger Dijkstra"
         email "edsger.dijkstra@it.nl"
         password "programming"
         password_confirmation "programming"
         confirmed_at DateTime.now
         role 2
    end

end
