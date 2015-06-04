Stel(/^ik ben als juridische profesional op de "(.*?)" pagina voor de juridische professional$/) do |arg1|
  page_url_and_title = arg1.split(",")
  visit page_url_and_title[0]
  page.find("title", text: page_url_and_title[1].strip, visible: false)
end

Als(/^ik dan op de "(.*?)" button klik$/) do |button|
  find_link(button).click
end

Dan(/^verwacht ik op de "(.*?)" pagina terecht te komen$/) do |titel|
  page.find("title", text: titel, visible: false)
end
