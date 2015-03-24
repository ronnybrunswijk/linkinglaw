Given(/^a user types www\.linkinglaw\.nl"(.*?)" into the addressbar of his browser$/) do |urlPath|
    visit urlPath
end

Then(/^the page titled "(.*?)" appears$/) do |title|
    page.find("title", text: title)
end

Given(/^a user is at LinkingLaw home page$/) do
    visit '/'
end

When(/^he clicks the "(.*?)" link$/) do |link|
    click_link link
end
