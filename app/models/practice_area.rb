# == Schema Information
#
# Table name: practice_areas
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  subject    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class PracticeArea < ActiveRecord::Base
    has_and_belongs_to_many :profiles
end
