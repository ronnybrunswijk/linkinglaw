class UserMailer < ActionMailer::Base
  default from: "info@linkinglaw.nl"

  # TODO De user even ut de signatuur helje, want eltse fraach hat in user 
  def confirm_question(user, question)
     @question = question
     mail(to: user.email, 
          subject:'Uw vraag is op LinkingLaw geplaatst')
  end
end
