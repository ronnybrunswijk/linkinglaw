Stel(/^ik bevind me als juridische professional op de notificatie instellingen pagina$/) do
    visit edit_notification_setting_path(@current_user.notification_setting.id)
    page.find("title", "Notificaties Instellen", visible: false)
end

Dan(/^wil ik de mogelijkheid hebben om in te stellen dat ik (\d+) keer per dag om (\d+):(\d+) uur bericht wil worden over nieuwe vragen$/) do |arg1, arg2, arg3|
    @daily_interval = Interval.find_by(hours: 24)
    @hour_option = 18
    choose "notification_setting_interval_id_#{@daily_interval.id}"
    select(@hour_option.to_s, from: "notification_setting_next_point_in_time_4i")
    click_button 'Bewaar'    
end

Dan(/^er zeker van zijn dat mijn frequentie instellingen bewaard blijven$/) do
    @current_user.reload
    notification_setting = @current_user.notification_setting
    assert_equal @daily_interval, notification_setting.interval
    assert_equal @hour_option, notification_setting.next_point_in_time.hour 
end

Stel(/^mijn frequentie van berichtgeving is ingesteld op 'Meteen'$/) do
    immediate_interval = Interval.find_by(hours: 0)
    has_checked_field? "notification_setting_interval_id_#{immediate_interval.id}"
end

Dan(/^wil ik geen mogelijkheid om ook een tijdstip in te stellen, zodat ik niet verward raak$/) do
    page.find_by_id('time-select', visible: false) 
end

Als(/^ik vervolgens de frequentie instel op '1 keer per dag'$/) do
    daily_interval = Interval.find_by(hours: 24)
    choose "notification_setting_interval_id_#{daily_interval.id}"
    has_checked_field? "notification_setting_interval_id_#{daily_interval.id}"
end

Dan(/^wil ik de mogelijkheid hebben om een tijdstip in te stellen$/) do
    page.find_by_id('time-select', visible: true)     
end

Stel(/^mijn frequentie van berichtgeving is ingesteld op '1 keer per dag'$/) do
    daily_interval = Interval.find_by(hours: 24)
    has_checked_field? "notification_setting_interval_id_#{daily_interval.id}"
end

Als(/^ik vervolgens de frequentie instel op 'Meteen'$/) do
    immediate_interval = Interval.find_by(hours: 0)
    choose "notification_setting_interval_id_#{immediate_interval.id}"
end

Dan(/^wil ik kunnen instellen dat ik alleen bericht word over vragen gesteld door ondernemers uit Friesland en Groningen$/) do
    @regio_friesland = Province.find_by(name: "Friesland")
    @regio_groningen = Province.find_by(name: "Groningen")    
    check "notification_setting_province_ids_#{@regio_friesland.id}"
    check "notification_setting_province_ids_#{@regio_groningen.id}"
    click_button "Bewaar"
end

Dan(/^er zeker van zijn dat mijn regio instellingen bewaard blijven$/) do
    notification_setting = @current_user.notification_setting
    assert_equal 2, notification_setting.provinces.size
    assert notification_setting.provinces.include? @regio_friesland
    assert notification_setting.provinces.include? @regio_groningen
end

Dan(/^wil ik kunnen instellen dat ik alleen bericht word over vragen die gaan over huurrecht en contractenrecht$/) do
    @rechtsgebied_huurrecht = PracticeArea.find_by(name: "Huurrecht")
    @rechtsgebied_contractenrecht = PracticeArea.find_by(name: "Contractenrecht")    
    check "notification_setting_practice_area_ids_#{@rechtsgebied_huurrecht.id}"
    check "notification_setting_practice_area_ids_#{@rechtsgebied_contractenrecht.id}"
    click_button "Bewaar"    
end

Dan(/^er zeker van zijn dat mijn rechtsgebieden instellingen bewaard blijven$/) do
    notification_setting = @current_user.notification_setting
    assert_equal 2, notification_setting.practice_areas.size
    assert notification_setting.practice_areas.include? @rechtsgebied_contractenrecht
    assert notification_setting.practice_areas.include? @rechtsgebied_huurrecht
end
