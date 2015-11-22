# == Schema Information
#
# Table name: intervals
#
#  id    :integer          not null, primary key
#  name  :string(255)
#  hours :integer
#

FactoryGirl.define do

    factory :never, class: Interval do
        name "Nooit"
        hours (-1)
    end

    factory :immediately, class: Interval do
        name "Meteen"
        hours 0
    end    
    
    factory :daily, class: Interval do
        name "1 keer per dag"
        hours 24
    end

end
