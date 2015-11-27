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

    factory :drenthe, class: Province do
        name "Drenthe"
    end 

    factory :groningen, class: Province do
        name "Groningen"
    end 

    factory :limburg, class: Province do 
       name "Limburg" 
    end
    
    factory :noord_brabant, class: Province do 
       name "Noord-Brabant" 
    end    

    factory :zeeland, class: Province do 
       name "Zeeland" 
    end    

    factory :provinces, class: Province do
        sequence(:name) { |n| "Province #{n}" }
    end

end
