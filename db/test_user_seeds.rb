### cleanup first
User.delete_all
### Test accounts Rienk
entrepreneur_rienk = User.create(name: "Rienk Boonstra", 
                           email: ENV["ENTREPRENEUR_EMAIL"], 
                           password: ENV["USER_PASSWORD"], 
                           password_confirmation: ENV["USER_PASSWORD"], 
                           confirmed_at: DateTime.current)

lawyer_rienk = User.create(name: "Rienk Boonstra", 
                     email: ENV["LAWYER_EMAIL"], 
                     password: ENV["USER_PASSWORD"],
                     password_confirmation: ENV["USER_PASSWORD"], 
                     confirmed_at: DateTime.current,
                     role: 1)

profile_rienk = Profile.create(first_name: "Rienk",
                         last_name: "Boonstra",
                         phone: "+31620528236",
                         profession: "lawyer",
                         disciplinary_decision: false,
                         years_of_work_experience: 15,
                         chamber_of_commerce_no: "711")
                         
friesland = Province.find_by(name: "Friesland")                          
profile_rienk.address = Address.create(zip_code: "9035CC",
                                 street: "Hoyte Roucomastrjitte",
                                 city: "Dronryp",
                                 housenumber: "2",
                                 housenumber_suffix: "hs",
                                 province_id: friesland.id)                        
                                 
profile_rienk.practice_areas = PracticeArea.take(3)                                
lawyer_rienk.profile = profile_rienk

notification_setting = NotificationSetting.create
notification_setting.interval = Interval.find_by(hours: 0)
lawyer_rienk.notification_setting = notification_setting
lawyer_rienk.save