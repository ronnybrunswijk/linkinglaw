Stel(/^ik bevind me op de 'home' pagina van LinkingLaw\.nl$/) do
   visit root_path
   page.find("title", text: "Home")
end

Stel(/^ik wil me registreren als juridische professional$/) do
end

Dan(/^wil ik een duidelijke optie die leidt naar het registratieformulier voor de juridisch professional$/) do
#   page.find("a", text: "Registreren juridische professional")
end

Als(/^ik dan naar registratieformulier voor de juridisch professional ga$/) do
#    pending # express the regexp above with the code you wish you had
end

Dan(/^wil ik alle noodzakelijke gegevens kunnen opvoeren$/) do
#    pending # express the regexp above with the code you wish you had
end

Dan(/^bevestigd worden van mijn registratie$/) do
#    pending # express the regexp above with the code you wish you had
end
