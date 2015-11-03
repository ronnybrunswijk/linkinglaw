Stel(/^ik bekijk als juridische professional bevind ik me op de notificatie instellingen pagina$/) do
    visit edit_notification_setting_path(@current_user.notification_setting.id)
    page.find("title", "Notificaties Instellen", visible: false)
end

Dan(/^wil ik de mogelijkheid hebben om in te stellen dat ik (\d+) keer per dag bericht wil worden over nieuwe vragen$/) do |arg1|
    regularity_every_2_days = Regularity.find_by(name: '1 keer per 3 dagen')
    choose "notification_setting_regularity_id_#{regularity_every_2_days.id}"
    click_button 'Bewaar'
end

Dan(/^er zeker van zijn dat mijn instellingen bewaard blijven$/) do

end
