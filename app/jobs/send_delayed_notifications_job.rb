class SendDelayedNotificationsJob 
   include Sidekiq::Worker
    
   def perform()

      # select lawyers to notify this hour 
      lawyers = User.select_lawyers_to_notify()
      questions = []
      
      lawyers.each do |lawyer|
         notification_setting = lawyer.notification_setting
         questions = Question.select_questions_asked_after(notification_setting)
         notification_setting.update_next_point_in_time         
         NotificationMailer.notify_lawyer(lawyer,questions).deliver!         
      end
   end

end