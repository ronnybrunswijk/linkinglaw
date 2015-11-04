class SendNotificationsJob 
   include Sidekiq::Worker
    
   def perform(question)
      
      lawyers = User.where("role = ?", 1)
      lawyers.each do |lawyer|
         NotificationMailer.notify_lawyer(lawyer, question).deliver!         
      end
   end
    
end