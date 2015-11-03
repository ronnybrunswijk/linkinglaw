FactoryGirl.define do
    
    factory :immediately, class: Regularity do
        name "Meteen"
    end    
    
    factory :daily, class: Regularity do
        name "1 keer per dag"
    end

    factory :every_3_days, class: Regularity do
        name "1 keer per 3 dagen"
    end
end
