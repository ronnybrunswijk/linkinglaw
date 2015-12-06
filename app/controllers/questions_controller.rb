class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :create, :list]
  before_action :entrepreneur_only, only: [:index, :create] 
  before_action :lawyer_only, only: [:list]
  before_action :set_question, only: [:show, :update, :destroy]
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
      UserMailer.delay.confirm_question(current_user, @question)
      SendNotificationsJob.perform_async(@question.id)
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

 def modify
   @question = Question.new(question_params)
   render :new
 end

  def list
    @questions = current_user.notification_setting.select_questions(false)
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :description, :practice_area_id, :province_id)
    end
end
