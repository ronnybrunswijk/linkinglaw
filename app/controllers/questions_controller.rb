class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

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
   puts 'preview method'
   @question = Question.new(question_params)
   respond_with(@question)
 end

  private
    def set_question
      puts 'set_question method'
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :description)
    end
end
