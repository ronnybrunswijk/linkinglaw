class SendNotificationsJob 
   include Sidekiq::Worker
    
   def perform(question)
      
      lawyers = NotificationSetting.select_lawyers_to_notify_immediately()
      lawyers.each do |lawyer|
         NotificationMailer.notify_lawyer(lawyer, question).deliver!         
      end
   end
    
end