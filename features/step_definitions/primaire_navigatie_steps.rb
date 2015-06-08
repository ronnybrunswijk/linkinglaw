Stel(/^als gebruiker voer ik www\.linkinglaw\.nl"(.*?)" in in de adresbak van mijn browser$/) do |urlPath|
   visit urlPath
end

Dan(/^kom ik op de pagina getiteld "(.*?)"$/) do |title|
   page.find("title", text: title, visible: false)
end

Stel(/^als gebruiker ben ik op de home pagina$/) do
   visit '/'
end

Als(/^ik dan op de "(.*?)" link klik$/) do |link|
   click_link link
end

Stel(/^als juridische professional bevind ik me op de home pagina en ben ingelogd$/) do
  visit '/'
  assert_equal "lawyer", @current_user.role 
end

Als(/^ik dan op de "(.*?)" link klik in het menu voor de ingelogde juridische professional$/) do |link|
  click_link @current_user.email
  click_link link
end
