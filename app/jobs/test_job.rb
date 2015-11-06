class TestJob 
   include Sidekiq::Worker
    
   def perform()
        
        puts "Are you a photographer? No, I'm a combat correspondent."      

   end
    
end