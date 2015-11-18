# == Schema Information
#
# Table name: intervals
#
#  id    :integer          not null, primary key
#  name  :string(255)
#  hours :integer
#

FactoryGirl.define do
    
    factory :immediately, class: Interval do
        name "Meteen"
        hours 0
    end    
    
    factory :daily, class: Interval do
        name "1 keer per dag"
        hours 24
    end

    factory :every_3_days, class: Interval do
        name "1 keer per 3 dagen"
        hours 72
    end
end
