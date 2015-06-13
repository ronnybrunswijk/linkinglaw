# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  first_name :string(255)
#  last_name  :string(255)
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#

FactoryGirl.define do

      factory :profile, class: Profile do
            first_name "Abraham"
            last_name "Lincoln"
      end
end
