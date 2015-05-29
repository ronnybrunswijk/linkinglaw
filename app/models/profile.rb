# == Schema Information
#
# Table name: profiles
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  practise_area :integer
#  created_at    :datetime
#  updated_at    :datetime
#  user_id       :integer
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#

class Profile < ActiveRecord::Base
end
