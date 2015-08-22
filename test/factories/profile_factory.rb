# == Schema Information
#
# Table name: profiles
#
#  id                       :integer          not null, primary key
#  created_at               :datetime
#  updated_at               :datetime
#  user_id                  :integer
#  first_name               :string(255)
#  last_name                :string(255)
#  phone                    :string(255)
#  profession               :string(255)
#  disciplinary_decision    :boolean
#  years_of_work_experience :integer
#  chamber_of_commerce_no   :string(255)
#  avatar_url               :string(255)
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#

FactoryGirl.define do

      factory :profile, class: Profile do
            first_name "Abraham"
            last_name "Lincoln"
            phone "+1 202-456-1111"
            avatar_url "http://image.jpg"
            
            trait :with_2_practice_areas do
                  after(:create) do |profile|
                        profile.practice_areas = [FactoryGirl.create(:aansprakelijkheidsrecht),
                        FactoryGirl.create(:arbeids_en_pensioenrecht)]
                  end
            end

            trait :with_aansprakelijkheidsrecht do
                  after(:create) do |profile|
                        profile.practice_areas = [FactoryGirl.create(:aansprakelijkheidsrecht)]
                  end
            end

            trait :with_arbeids_en_pensioenrecht do
                  after(:create) do |profile|
                        profile.practice_areas = [FactoryGirl.create(:arbeids_en_pensioenrecht)]                        
                  end
            end

            trait :with_contractenrecht do
                  after(:create) do |profile|
                        profile.practice_areas = [FactoryGirl.create(:contractenrecht)]                        
                  end
            end

            trait :from_friesland do
                  address { FactoryGirl.create(:address, :in_friesland) }                               
            end

            trait :from_groningen do
                  address { FactoryGirl.create(:address, :in_groningen) }                   
            end 

            trait :from_drenthe do
                  address { FactoryGirl.create(:address, :in_drenthe) }                   
            end 
            
            trait :with_reviews do
                  reviews { FactoryGirl.create_list(:review_with_only_body_and_title, 3)}   
            end
      end
end
