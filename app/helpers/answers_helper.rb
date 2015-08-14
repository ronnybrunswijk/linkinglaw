module AnswersHelper
    
    def is_endorsed_by_current_user(current_user, answer)
        profile_id = current_user.profile.id
        Endorsement.exists? profile_id: profile_id, answer_id: answer.id
    end
    
end
