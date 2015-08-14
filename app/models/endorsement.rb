# == Schema Information
#
# Table name: endorsements
#
#  profile_id :integer
#  answer_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Endorsement < ActiveRecord::Base
    self.primary_keys = :profile_id, :answer_id
    belongs_to :answer
    belongs_to :profile
end
