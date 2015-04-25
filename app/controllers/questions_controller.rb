class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  after_action :send_confirmation_email, only: [:create]
  respond_to :html

  def index
    @questions = Question.all
    respond_with(@questions)
  end

  def show
    respond_with(@question)
  end

  def new
    @question = Question.new
    respond_with(@question)
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
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
end
