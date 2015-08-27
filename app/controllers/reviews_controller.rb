class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :entrepreneur_only 
  before_action :set_profile_id, only: [:new]
 
  respond_to :html

  def new
    @review = Review.new
    respond_with(@review, @profile_id)
  end

  def create
    review = Review.new(review_params)
    review.user = current_user
    review.save
    redirect_to profile_path review.profile_id
  end

  private
  
    def set_profile_id
      @profile_id = params[:profile_id]
    end
  
    def review_params
      params.require(:review).permit(:profile_id, :title, :body, :rating)
    end
end
