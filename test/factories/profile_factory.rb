# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#

FactoryGirl.define do

      factory :profile, class: Profile do

      end
end
