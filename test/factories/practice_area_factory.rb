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

    factory :aansprakelijkheidsrecht, class: PracticeArea do
        name "Aansprakelijkheidsrecht"
        subject "letsel, schade, aansprakelijkheid"
    end

    factory :arbeids_en_pensioenrecht, class: PracticeArea do
        name "Arbeids- en pensioenrecht"
        subject "werk, inkomen, ontslag, pensioen"
    end

end
  
