Stel(/^als juridische professional heb ik me net geregistreerd met een initieel aangemaakt profiel$/) do
   @profile = @current_user.profile
   refute_nil @profile
   assert_empty @profile.practice_areas
   assert_equal @profile.created_at.strftime("%d/%m/%Y %H:%M"), @profile.updated_at.strftime("%d/%m/%Y %H:%M")
end

Dan(/^wil ik de mogelijkheid hebben om mijn profiel te kunnen aanvullen$/) do
    click_link @current_user.email
    click_link "Profiel instellingen"
    page.find("title", text: "Profiel Instellingen", visible: false)
    @practice_areas = PracticeArea.take(2)
    @practice_areas.each do |practice_area|
        check "profile_practice_area_ids_#{practice_area.id}"
    end
    click_button "Profiel bewaren"
end

Dan(/^ervan verzekerd zijn dat mijn gegevens correct worden opgeslagen$/) do
    @profile.reload
    assert_equal 2, @profile.practice_areas.size
    assert_equal @practice_areas, @profile.practice_areas
end
