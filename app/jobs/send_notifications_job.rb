class SendNotificationsJob 
   include Sidekiq::Worker
    
   def perform(question_id)

      question = Question.find question_id
      lawyers = question.select_lawyers_to_notify_immediately()

      lawyers.each do |lawyer|
         NotificationMailer.notify_lawyer(lawyer, question).deliver!         
      end

   end
    
end