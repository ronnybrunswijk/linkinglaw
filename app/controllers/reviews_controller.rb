class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :entrepreneur_only, only: [:create] 
 
  respond_to :html

  def new
    @review = Review.new
    @profile_id = params[:profile_id]
    respond_with(@review, @profile_id)
  end

  def create
    review = Review.new(review_params)
    review.user = current_user
    review.save
    redirect_to profile_path review.profile_id
  end

  private
  
    def review_params
      params.require(:review).permit(:profile_id, :title, :body, :rating)
    end
end
