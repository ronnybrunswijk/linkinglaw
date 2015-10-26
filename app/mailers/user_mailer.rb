class UserMailer < ActionMailer::Base
  default from: "info@linkinglaw.nl"

  # TODO De user even ut de signatuur helje, want eltse fraach hat in user 
  def confirm_question(user, question)
     @question = question
     mail(to: user.email, 
          subject:'Uw vraag is op LinkingLaw geplaatst' , 
          question: @question)
  end

  # Notifies an entrepeneur about the fact that one of his questions has just been answered.
  def notify_entrepreneur(answer)
      @answer = answer
      user = answer.question.user
      mail(to: user.email, 
               subject: "Antwoord op uw vraag",
               answer: answer)
  end 
  
end
