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
#  business_address         :string(255)
#  city                     :string(255)
#  phone                    :string(255)
#  profession               :string(255)
#  disciplinary_decision    :boolean
#  year_of_inauguration     :integer
#  years_of_work_experience :integer
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#

FactoryGirl.define do

      factory :profile, class: Profile do
            first_name "Abraham"
            last_name "Lincoln"
            business_address "1600 Pennsylvania Ave NW"
            city "Washington"
            phone "+1 202-456-1111"
      end
end
