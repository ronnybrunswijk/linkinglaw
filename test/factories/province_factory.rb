# == Schema Information
#
# Table name: provinces
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do

    factory :friesland, class: Province do
        name "Friesland"
    end 
    
    factory :limburg, class: Province do 
       name "Limburg" 
    end
    
    factory :noord_brabant, class: Province do 
       name "Noord-Brabant" 
    end    
    
    factory :provinces, class: Province do
        sequence(:name) { |n| "Province #{n}" }
    end

end
