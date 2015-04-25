class UserMailer < ActionMailer::Base
  default from: "info@linkinglaw.nl"
 
  def confirm_question(user, question)
     @user = user
     @question = question
     mail(to: @user.email, user: @user,  question: @question)
  end
  
end
