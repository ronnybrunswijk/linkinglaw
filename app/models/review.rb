# == Schema Information
#
# Table name: reviews
#
#  user_id    :integer
#  profile_id :integer
#  title      :string(255)
#  body       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_reviews_on_profile_id  (profile_id)
#  index_reviews_on_user_id     (user_id)
#

class Review < ActiveRecord::Base
    self.primary_keys = :profile_id, :user_id
    belongs_to :profile
    belongs_to :user
end
