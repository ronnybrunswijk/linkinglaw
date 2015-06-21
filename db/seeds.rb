# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
practice_areas = [
    ["Aansprakelijkheidsrecht", "letsel, schade, aansprakelijkheid"],
    ["Arbeids- en pensioenrecht", "werk, inkomen, ontslag, pensioen"],
    ["Contractenrecht", "overeenkomsten, algemene voorwaarden"],
    ["Faillissementsrecht", "faillissement, doorstart, WSNP"],
    ["Financieel toezichtrecht", "AFM, DNB, zorgplicht, klant belang centraal"],
    ["Financierings- en zekerhedenrecht", "krediet, pandrecht, eigendomsvoorbehoud"],
    ["Fiscaal recht", "belasting, BTW, VAR, invoerrechten"],
    ["Geschillen en gerechtelijke procedures", "klachten, mediation, dagvaarden"],
    ["Huurrecht", "belasting, BTW, VAR, invoerrechten"],
    ["Incassorecht", "incasso, betalingsachterstand, beslaglegging"],
    ["Intellectueel eigendoms- en privacyrecht", "merk, domeinnaam, handelsnaam, privacy"],
    ["Internationaal privaatrecht", "internationale handel, Weens koopverdrag"],
    ["Mededingingsrecht", "oneerlijke concurrentie, kartelverbod, concentraties"],
    ["Milieurecht", "vergunningaanvraag, bodemverontreiniging"],
    ["Personen- en familierecht", "huwelijk, echtscheiding, overlijden"],
    ["Vennootschapsrecht", "rechtsvormen, ZZP, start-up"],
    ["Verzekeringsrecht", "verzekering, assurantien, rechtsbijstand"],
    ["Overig of onbekend", "overig, onbekend"]
]

practice_areas.each do |name, subject|
  PracticeArea.create(name: name, subject: subject)
end