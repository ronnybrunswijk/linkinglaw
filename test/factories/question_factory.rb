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

FactoryGirl.define do

    factory :question do
       title "title"
       description "description"

       trait :with_practice_area do
           practice_area { FactoryGirl.create(:aansprakelijkheidsrecht) }        
       end

       trait :with_answers do
            after(:create) do |question|
                FactoryGirl.create_list(:answers, 2, question: question)
            end
       end       
       
       trait :with_provinces do
            after(:create) do |question|
                question.provinces = FactoryGirl.create_list(:province, 2)
            end
       end
   end

   factory :questions, class: Question do
        title { generate :title }
        description "description"
        practice_area { FactoryGirl.create(:aansprakelijkheidsrecht) }                
   end
   
   sequence :title  do |n|
       "title #{n}"
   end
   
end
  
