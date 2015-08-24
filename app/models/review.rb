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
#  rating     :float
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
