class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :entrepreneur_only 

  respond_to :html

  def new
    @review = Review.new
    respond_with(@review)
  end

  def create
    review = Review.new(review_params)
    review.user = current_user
    review.save
    render json: {success: true}
  end

  # TODO robuust meitsje, dus wat barret 'r wanneer endorsement nil is.
  def destroy
    endorsement = Endorsement.find([@profile_id, @answer_id])
    endorsement.delete
    return render partial: 'create', locals: {answer_id: @answer_id}    
  end

  private
    def review_params
      params.require(:review).permit(:profile_id, :title, :body)
    end
end
