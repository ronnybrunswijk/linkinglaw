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

class Profile < ActiveRecord::Base
  enum practice_area: [:echtscheidingen, :contracten, :belastingen]
end
