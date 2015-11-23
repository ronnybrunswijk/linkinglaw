# == Schema Information
#
# Table name: provinces
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Province < ActiveRecord::Base
    has_and_belongs_to_many :questions
    has_and_belongs_to_many :notification_settings    
end
