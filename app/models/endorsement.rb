# == Schema Information
#
# Table name: endorsements
#
#  id         :integer          not null, primary key
#  profile_id :integer
#  answer_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Endorsement < ActiveRecord::Base
    belongs_to :answer
    belongs_to :profile
end
