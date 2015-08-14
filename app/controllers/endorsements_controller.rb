class EndorsementsController < ApplicationController
  before_action :authenticate_user!
  before_action :lawyer_only 
  before_action :set_profile_id 
  before_action :set_answer_id

  respond_to :html

  def create
    endorsement = Endorsement.new(profile_id: @profile_id, answer_id: @answer_id)
    endorsement.save
    return render partial: 'destroy', locals: {answer_id: @answer_id}
  end

  # TODO robuust meitsje, dus wat barret 'r wanneer endorsement nil is.
  def destroy
    endorsement = Endorsement.find([@profile_id, @answer_id])
    endorsement.delete
    return render partial: 'create', locals: {answer_id: @answer_id}    
  end

  private
    def set_profile_id
      @profile_id = current_user.profile.id 
    end
    
    def set_answer_id
      @answer_id = params[:answer_id]
    end

    def endorsement_params
      params.require(:endorsement).permit(:answer_id)
    end
end
