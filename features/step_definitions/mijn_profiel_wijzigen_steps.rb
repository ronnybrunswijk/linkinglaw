Stel(/^als juridische professional heb ik me net geregistreerd met een initieel aangemaakt profiel$/) do
   profile = @current_user.profile
   refute_nil profile
   assert_empty profile.practice_areas
   assert_equal profile.created_at.to_s, profile.updated_at.to_s
end

Dan(/^wil ik de mogelijkheid hebben om mijn profiel te kunnen aanvullen$/) do
        
end

Dan(/^ervan verzekerd zijn dat mijn gegevens correct worden opgeslagen$/) do

end
