class NotificationMailer < ActionMailer::Base
  default from: "info@linkinglaw.nl"

  # Notifies a lawyer about the fact that a question has been asked by an entrepreneur.
  def notify_lawyer(lawyer, question)
      @lawyer = lawyer
      @question = question
      mail(to: @lawyer.email, 
           subject: "Er is een nieuwe vraag geplaatst")
  end 

  # Notifies an entrepeneur about the fact that one of his questions has just been answered.
  def notify_entrepreneur(answer)
      @answer = answer
      user = answer.question.user
      mail(to: user.email, 
           subject: "Antwoord op uw vraag")
  end 

end
