# == Schema Information
#
# Table name: addresses
#
#  id                 :integer          not null, primary key
#  zip_code           :string(255)
#  street             :string(255)
#  housenumber        :string(255)
#  housenumber_suffix :string(255)
#  city               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  profile_id         :integer
#  province_id        :integer
#
# Indexes
#
#  index_addresses_on_profile_id   (profile_id)
#  index_addresses_on_province_id  (province_id)
#
FactoryGirl.define do
    
    factory :address do
        street "Hoyte Roucomastrjitte"
        housenumber "2"
        housenumber_suffix "A"
        zip_code "9035CC"
        city "Dronryp"
        province { FactoryGirl.create(:friesland) }
        
        trait :in_groningen do
            province { FactoryGirl.create(:groningen) }            
        end
        
        trait :in_drenthe do
            province { FactoryGirl.create(:drenthe) }            
        end        
        
    end
end
