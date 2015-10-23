class SendConfirmationEmailJob < ActiveJob::Base
    
   queue_as :default
   
   def perform(answer)
       
   end
    
end