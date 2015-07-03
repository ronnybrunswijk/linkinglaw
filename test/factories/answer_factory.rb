# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  text        :text
#  created_at  :datetime
#  updated_at  :datetime
#  question_id :integer
#  user_id     :integer
#
# Indexes
#
#  index_answers_on_question_id  (question_id)
#  index_answers_on_user_id      (user_id)
#

FactoryGirl.define do

    factory :answer do
        text "No, I'm a combat correspondent."
        after(:create) do |answer| 
            FactoryGirl.create(:user, :lawyer, answer) 
        end
    end

    factory :answers, class: Answer do
        sequence(:text) { |n| "answer #{n}" }
    end

end
