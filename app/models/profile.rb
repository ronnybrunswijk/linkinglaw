# == Schema Information
#
# Table name: profiles
#
#  id                       :integer          not null, primary key
#  created_at               :datetime
#  updated_at               :datetime
#  user_id                  :integer
#  first_name               :string(255)
#  last_name                :string(255)
#  business_address         :string(255)
#  city                     :string(255)
#  phone                    :string(255)
#  profession               :string(255)
#  disciplinary_decision    :boolean
#  year_of_inauguration     :integer
#  years_of_work_experience :integer
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#

class Profile < ActiveRecord::Base
end
