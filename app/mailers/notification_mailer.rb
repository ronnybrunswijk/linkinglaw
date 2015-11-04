class NotificationMailer < ActionMailer::Base
  default from: "info@linkinglaw.nl"

  # Notifies a lawyer about the fact that a question has been asked by an entrepreneur.
  def notify_lawyer(lawyer, question)
      @lawyer = lawyer
      @question = question
      mail(to: @lawyer.email, 
           subject: "Er is een nieuwe vraag geplaatst")
  end 
  
end
