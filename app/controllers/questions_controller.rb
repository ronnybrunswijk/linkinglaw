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
      set_practice_area
      flash[:notice] = t(:save_success, scope: [:questions, :notifications]) if @question.save
      UserMailer.confirm_question(current_user, @question).deliver!
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
    @questions = Question.all
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :description)
    end

    def set_practice_area
      practice_area_id = params[:practice_areas]
      if practice_area_id
        @question.practice_area = PracticeArea.find(practice_area_id) 
      else 
        @question.practice_area = PracticeArea.first
      end
    end
end
