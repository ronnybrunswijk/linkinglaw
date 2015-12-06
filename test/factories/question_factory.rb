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

FactoryGirl.define do

    factory :question do
       title "title"
       description "description"
       province { FactoryGirl.create(:friesland)} 

       trait :with_aansprakelijkheidsrecht do
           practice_area { FactoryGirl.create(:aansprakelijkheidsrecht) }        
       end

       trait :with_contractenrecht do
           practice_area { FactoryGirl.create(:contractenrecht) }        
       end

       trait :with_answers do
            after(:create) do |question|
                FactoryGirl.create_list(:answer, 2, question: question)
            end
       end       

       trait :from_zeeland do
            province { FactoryGirl.create(:zeeland)}
       end

       trait :from_limburg do
            province { FactoryGirl.create(:limburg)}
       end

       trait :from_noord_brabant do
            province { FactoryGirl.create(:noord_brabant)}
       end

       trait :from_noord_holland do
            province { FactoryGirl.create(:noord_holland)}
       end

       trait :created_25_hours_ago do
            created_at DateTime.current.beginning_of_hour - 25.hours
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
  
