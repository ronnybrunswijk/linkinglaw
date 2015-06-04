# -*- coding: utf-8 -*-
Stel(/^ik bevind me op de landings pagina voor de juridische professional en ik wil me registreren$/) do
  visit '/lawyer'
  page.find("title", "Juridische Professional", visible: false)
end

Dan(/^wil ik een duidelijke optie die leidt naar het registratieformulier$/) do
  find_link "signup-lawyer"
end

Als(/^ik dan naar registratieformulier voor de juridisch professional ga$/) do
  click_link "signup-lawyer"
  page.find('title', "Registreren Juridiscche Professional", visible: false) 
end

Dan(/^wil ik alle noodzakelijke gegevens kunnen opvoeren en verzenden$/) do
  fill_in "user_name", with: "Sinterklaas"
  fill_in "user_email", with: "sinter@klaas.nl"
  fill_in "user_password", with: "sinterklaas"
  fill_in "user_password_confirmation", with: "sinterklaas"
   
end

Dan(/^daarna verwittigd worden over dat mijn registratie gelukt is$/) do

end

