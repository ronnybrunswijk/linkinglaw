# == Schema Information
#
# Table name: endorsements
#
#  profile_id :integer
#  answer_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
    
    factory :endorsement do
        profile {FactoryGirl.create(:lawyer).profile}        
        answer {FactoryGirl.create(:answer)}
    end
end
