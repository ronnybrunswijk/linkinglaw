# == Schema Information
#
# Table name: regularities
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class Regularity < ActiveRecord::Base
    has_many :notification_setting
end
