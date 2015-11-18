Stel(/^ik bevind me als juridische professional op de notificatie instellingen pagina$/) do
    visit edit_notification_setting_path(@current_user.notification_setting.id)
    page.find("title", "Notificaties Instellen", visible: false)
end

Dan(/^wil ik de mogelijkheid hebben om in te stellen dat ik (\d+) keer per dag om (\d+):(\d+) uur bericht wil worden over nieuwe vragen$/) do |arg1, arg2, arg3|
    @interval_every_3_days = Interval.find_by(name: '1 keer per 3 dagen')
    @hour_option = 18
    choose "notification_setting_interval_id_#{@interval_every_3_days.id}"
    select(@hour_option.to_s, from: "notification_setting_next_point_in_time_4i")
    click_button 'Bewaar'    
end

Dan(/^er zeker van zijn dat mijn instellingen bewaard blijven$/) do
    @current_user.reload
    notification_setting = @current_user.notification_setting
    assert_equal @interval_every_3_days, notification_setting.interval
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
    has_checked_field? "notification_setting_interval_id_#{immediate_interval.id}"
end
