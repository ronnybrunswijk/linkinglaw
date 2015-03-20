Given(/^I am on the LinkingLaw home page$/) do
  visit root_path
end

Then(/^I should see$/) do |string|
  page.has_content?(string)
end
