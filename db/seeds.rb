# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
practice_areas = [
    ["Overig of onbekend", "overig, onbekend"],    
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
    ["Verzekeringsrecht", "verzekering, assurantien, rechtsbijstand"]
]

practice_areas.each do |name, subject|
  PracticeArea.find_or_create_by(name: name, subject: subject)
end

provinces = ["Groningen",
             "Friesland",
             "Drenthe",
             "Overijssel",
             "Flevoland",
             "Gelderland",
             "Utrecht",
             "Noord-Holland",
             "Zuid-Holland",
             "Zeeland",
             "Noord-Brabant",
             "Limburg"]

provinces.each do |name|
  Province.find_or_create_by(name: name)
end

noord_holland = Province.find_by name: "Noord-Holland"
zuid_holland = Province.find_by name: "Zuid-Holland"
zeeland = Province.find_by name: "Zeeland"
noord_brabant = Province.find_by name: "Noord-Brabant"
friesland = Province.find_by name: "Friesland"
groningen = Province.find_by name: "Groningen"
drenthe = Province.find_by name: "Drenthe"
gelderland = Province.find_by name: "Gelderland"
overijssel = Province.find_by name: "Overijssel"
limburg = Province.find_by name: "Limburg"
flevoland = Province.find_by name: "Flevoland"
utrecht = Province.find_by name: "Utrecht"

zip_code_ranges = [[1000,1299,noord_holland.id],[1300,1379,flevoland.id],[1380,1383,noord_holland.id],
                   [1390,1393,utrecht.id],[1394,1394,noord_holland.id],[1396,1396,utrecht.id],
                   [1398,1425,noord_holland.id],[1426,1427,utrecht.id],[1428,1429,zuid_holland.id],
                   [1430,2158,noord_holland.id],[2159,2164,zuid_holland.id],[2165,2165,noord_holland.id],
                   [2170,3381,zuid_holland.id],[3382,3464,utrecht.id],[3465,3466,zuid_holland.id],
                   [3467,3769,utrecht.id],[3770,3794,gelderland.id],[3795,3836,utrecht.id],
                   [3837,3888,gelderland.id],[3890,3899,flevoland.id],[3900,3924,utrecht.id],
                   [3925,3925,gelderland.id],[3926,3999,utrecht.id],[4000,4119,gelderland.id],
                   [4120,4125,utrecht.id],[4126,4129,zuid_holland.id],[4130,4139,utrecht.id],
                   [4140,4146,zuid_holland.id],[4147,4162,gelderland.id],[4163,4169,zuid_holland.id],
                   [4170,4199,gelderland.id],[4200,4209,zuid_holland.id],[4211,4212,gelderland.id],
                   [4213,4213,zuid_holland.id],[4214,4219,gelderland.id],[4220,4249,zuid_holland.id],
                   [4250,4299,noord_brabant.id],[4300,4599,zeeland.id],[4600,4671,noord_brabant.id],
                   [4672,4679,zeeland.id],[4680,4681,noord_brabant.id],[4682,4699,zeeland.id],
                   [4700,5299,noord_brabant.id],[5300,5335,gelderland.id],[5340,5765,noord_brabant.id],
                   [5766,5817,limburg.id],[5820,5846,noord_brabant.id],[5850,6019,limburg.id],
                   [6020,6029,noord_brabant.id],[6030,6499,limburg.id],[6500,6583,gelderland.id],
                   [6584,6599,limburg.id],[6600,7399,gelderland.id],[7400,7438,overijssel.id],
                   [7439,7439,gelderland.id],[7440,7739,overijssel.id],[7740,7766,drenthe.id],
                   [7767,7799,overijssel.id],[7800,7949,drenthe.id],[7950,7955,overijssel.id],
                   [7956,7999,drenthe.id],[8000,8049,overijssel.id],[8050,8054,gelderland.id],
                   [8055,8069,overijssel.id],[8070,8099,gelderland.id],[8100,8159,overijssel.id],
                   [8160,8195,gelderland.id],[8196,8199,overijssel.id],[8200,8259,flevoland.id],
                   [8260,8299,overijssel.id],[8300,8322,flevoland.id],[8323,8349,overijssel.id],
                   [8350,8354,drenthe.id],[8355,8379,overijssel.id],[8380,8387,drenthe.id],
                   [8388,9299,friesland.id],[9300,9349,drenthe.id],[9350,9399,groningen.id],
                   [9400,9478,drenthe.id],[9479,9479,groningen.id],[9480,9499,drenthe.id],
                   [9500,9509,groningen.id],[9510,9539,drenthe.id],[9540,9563,groningen.id],
                   [9564,9564,drenthe.id],[9565,9569,groningen.id],[9571,9579,drenthe.id],
                   [9580,9653,groningen.id],[9654,9659,drenthe.id],[9660,9748,groningen.id],
                   [9749,9749,drenthe.id],[9750,9759,groningen.id],[9760,9769,drenthe.id],
                   [9770,9849,groningen.id],[9850,9859,friesland.id],[9860,9869,groningen.id],
                   [9870,9879,friesland.id],[9880,9999,groningen.id]]

zip_code_ranges.each do |first, last, province_id|
   ZipCodeRange.find_or_create_by(first: first, last: last, province_id: province_id) 
end

regularities = ["Meteen", "1 keer per dag", "1 keer per 3 dagen"]

regularities.each do |name|
   Regularity.find_or_create_by(name: name) 
end


### Test accounts
entrepreneur = User.create(name: "Cornelius Vanderbilt", 
                           email: ENV["ENTREPRENEUR_EMAIL"], 
                           password: ENV["USER_PASSWORD"], 
                           password_confirmation: ENV["USER_PASSWORD"], 
                           confirmed_at: DateTime.now)

lawyer = User.create(name: "Abraham Lincoln", 
                     email: ENV["LAWYER_EMAIL"], 
                     password: ENV["USER_PASSWORD"],
                     password_confirmation: ENV["USER_PASSWORD"], 
                     confirmed_at: DateTime.now,
                     role: 1)

profile = Profile.create(first_name: "Abraham",
                         last_name: "Lincoln",
                         phone: "+1 202-456-1111",
                         profession: "lawyer",
                         disciplinary_decision: false,
                         years_of_work_experience: 75,
                         chamber_of_commerce_no: "711")
                         
profile.address = Address.create(zip_code: "9035CC",
                                 street: "Hoyte Roucomastrjitte",
                                 city: "Dronryp",
                                 housenumber: "2",
                                 housenumber_suffix: "hs",
                                 province_id: friesland.id)                        
                                 
profile.practice_areas = PracticeArea.take(3)                                
lawyer.profile = profile

notification_setting = NotificationSetting.create
notification_setting.regularity = Regularity.find_by(name: 'Meteen')
lawyer.notification_setting = notification_setting
lawyer.save