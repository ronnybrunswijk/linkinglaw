Stel(/^ik ben op de "(.*?)" pagina$/) do |arg1|
	visit("/home")
	page.has_content?("Linkinglaw | Home")		
end

Stel(/^ik klik op de "(.*?)" link$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Dan(/^beland ik op de waarnaar de lokale link verwijst$/) do
  pending # express the regexp above with the code you wish you had
end
