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

FactoryGirl.define do

    factory :practice_area, class: PracticeArea do
        name "name"
        subject "subject"
    end
end
  
