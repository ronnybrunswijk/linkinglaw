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

    factory :question1, class: Question do
        title "Question title1"
        description  "Question description1"
    end

    factory :question2, class: Question do
        title "Question title2"
        description  "Question description2"
    end

    factory :question3, class: Question do
        title "Question title3"
        description  "Question description3"
   end
   
   factory :question_with_practice_area, class: Question do
        title "title4"
        description "description4"
        practice_area { FactoryGirl.create(:aansprakelijkheidsrecht) }        
   end

   factory :questions, class: Question do
        title
        description "description"
   end
   
   sequence :title  do |n|
       "title #{n}"
   end
   
end
  
