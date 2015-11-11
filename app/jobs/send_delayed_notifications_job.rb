class SendDelayedNotificationsJob 
   include Sidekiq::Worker
    
   def perform()

      lawyers = User.where("role = ?", 1)
      question = Question.first
      
      lawyers.each do |lawyer|
         NotificationMailer.notify_lawyer(lawyer,question).deliver!         
      end
   end

end