# == Schema Information
#
# Table name: endorsements
#
#  profile_id :integer          primary key
#  answer_id  :integer          primary key
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
    
    factory :review do
        profile {FactoryGirl.create(:lawyer).profile}        
        user {FactoryGirl.create(:entrepreneur)}
    end
end
