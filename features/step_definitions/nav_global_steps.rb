Stel(/^als gebruiker voer ik www\.linkinglaw\.nl"(.*?)" in in de adresbak van mijn browser$/) do |urlPath|
   visit urlPath
end

Dan(/^kom ik op de pagina getiteld "(.*?)"$/) do |title|
   page.find("title", text: title)
end

Stel(/^als gebruiker ben ik op de home pagina$/) do
   visit '/'
end

Als(/^ik dan op de "(.*?)" link klik$/) do |link|
   click_link link
end
