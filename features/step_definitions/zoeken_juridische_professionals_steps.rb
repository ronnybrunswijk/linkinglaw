Stel(/^ik bevind als bezoeker op de home pagina van LinkingLaw$/) do
    visit '/'
    page.find("title", text: "Home", visible: false)
    page.find("a", text: "Log in")
end

Dan(/^wil ik de mogelijkheid hebben om een juridische professional te zoeken op basis van regio$/) do
    click_link "Vind een professional"
    page.find("title", text: "Vind een professional", visible: false)    
    click_link "Friesland"
end

Dan(/^vervolgens juridische professionals gepresenteerd te krijgen die voldoen aan mijn zoekcriterium$/) do
    assert page.has_css?("div#search-result a.profile-link", count: 1000)        
end
