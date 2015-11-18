# == Schema Information
#
# Table name: intervals
#
#  id    :integer          not null, primary key
#  name  :string(255)
#  hours :integer
#

class Interval < ActiveRecord::Base
    has_many :notification_setting
end
