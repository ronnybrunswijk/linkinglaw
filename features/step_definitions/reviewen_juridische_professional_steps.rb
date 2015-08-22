Stel(/^ik als ondernemer bekijk ik een profiel van juridische professional die mij een dienst heeft verleend$/) do
    @current_user.role = "entrepreneur"
    @profile = Profile.first
    visit "/profiles/#{@profile.id}"
    page.find("title", @profile.full_name, visible: false)    
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
    review = Review.find_by(profile_id: @profile.id, title: @title, body: @body)
    refute_nil review
end

Stel(/^ik als anonieme bezoeker bekijk ik een profiel van juridische professional$/) do
    visit "/profiles/#{@profile_with_reviews.id}"
    page.find("title", @profile_with_reviews.full_name, visible: false)    
end

Dan(/^wil ik daarbij ook de reviews zien die over de juridische professional geschreven zijn$/) do
    @profile_with_reviews.reviews.each do |review|
      page.find("p", text: review.title) 
    end
end
