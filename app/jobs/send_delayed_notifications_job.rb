class SendDelayedNotificationsJob 
   include Sidekiq::Worker
    
   def perform()

      # select lawyers to notify this hour 
      lawyers = NotificationSetting.select_lawyers_to_notify_periodically()
      questions = []
      
      lawyers.each do |lawyer|
         notification_setting = lawyer.notification_setting
         questions = notification_setting.select_questions(true)
         notification_setting.update_next_notification_time                  
         NotificationMailer.notify_lawyer(lawyer,questions).deliver! if not questions.empty?         
      end
   end

end