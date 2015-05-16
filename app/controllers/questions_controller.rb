class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :create]
  before_action :entrepreneur_only, only: [:index, :show, :create] 
  before_action :set_question, only: [:show, :update, :destroy]
  after_action :send_confirmation_email, only: [:create]
  respond_to :html

  def index
    @questions = current_user.questions
    respond_with(@questions)
  end

  def show
    respond_with(@question)
  end

  def new
    @question = Question.new
    respond_with(@question)
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if params[:create]
      flash[:notice] = t(:save_success, scope: [:questions, :notifications]) if @question.save
      respond_with(@question)
    else 
      render :new
    end
  end

  def update
    flash[:notice] = 'Question was successfully updated.' if @question.update(question_params)
    respond_with(@question)
  end

  def destroy
    @question.destroy
    respond_with(@question)
  end

 def preview
   @question = Question.new(question_params)
   if @question.valid?
     respond_with(@question)
   else 
     render :new
   end
 end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :description)
    end

   def send_confirmation_email
     UserMailer.confirm_question(current_user, @question).deliver!
   end

   def entrepreneur_only
      unless current_user.role == "entrepreneur"
          redirect_to root_url, alert: I18n.t(:unauthorized, scope: [:devise, :failure])
      end
   end
end
