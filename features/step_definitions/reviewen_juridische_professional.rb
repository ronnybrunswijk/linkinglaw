Stel(/^ik als ondernemer bekijk ik een profiel van juridische professional die mij een dienst heeft verleend$/) do
    @current_user.role = "entrepreneur"
    profile = Profile.first
    visit "/profiles/#{profile.id}"
    page.find("title", profile.full_name, visible: false)    
end

Dan(/^wil ik de mogelijkheid hebben om mijn ervaring met de juridische professional te evalueren$/) do
    click_link "Review deze juridische professional"
    page.find("title", "Review een juridische professional", visible: false)    
end

Dan(/^als ik een evaluatie schrijf$/) do
    @title = "title"; @body = "body"
    fill_in "review_title", with: @title
    fill_in "review_body", with: @body
    click_button "Review bewaren"
end

Dan(/^wil ik verzekerd van zijn dat mijn evaluatie correct wordt opgeslagen$/) do
    review = Review.find_by(title: @title, body: @body)
    refute_nil review
end
