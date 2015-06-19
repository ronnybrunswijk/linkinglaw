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
        title "Question title"
        description  "Question description"
    end

    factory :question2, class: Question do
        title "Question title"
        description  "Question description"
    end

    factory :question3, class: Question do
        title "Question title"
        description  "Question description"
   end
   
   factory :question_with_practice_area, class: Question do
        title "title"
        description "description"
        practice_area { FactoryGirl.create(:practice_area) }        
   end
end
  
