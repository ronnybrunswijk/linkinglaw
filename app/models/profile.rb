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
#  phone                    :string(255)
#  profession               :string(255)
#  disciplinary_decision    :boolean
#  years_of_work_experience :integer
#  chamber_of_commerce_no   :string(255)
#  avatar_url               :string(255)
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#

class Profile < ActiveRecord::Base
    has_and_belongs_to_many :practice_areas
    has_one :address
    accepts_nested_attributes_for :address
    
    def full_name
       "#{first_name} #{last_name}" 
    end
end
