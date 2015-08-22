# == Schema Information
#
# Table name: reviews
#
#  user_id    :integer          primary key
#  profile_id :integer          primary key
#  title      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_reviews_on_profile_id  (profile_id)
#  index_reviews_on_user_id     (user_id)
#

FactoryGirl.define do
    
    factory :review do
       title "title"
       body "body"
       profile {FactoryGirl.create(:lawyer).profile}        
       user {FactoryGirl.create(:entrepreneur)}
    end
    
    factory :review_with_only_body_and_title, class: Review do
        sequence(:title) {|n|"title#{n}"}
        body "body"
    end
end
