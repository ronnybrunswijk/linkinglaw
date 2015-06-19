class PracticeAreasController < ApplicationController
  before_action :set_practice_area, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @practice_areas = PracticeArea.all
    respond_with(@practice_areas)
  end

  def show
    respond_with(@practice_arease_area)
  end

  def new
    @practice_area = PracticeArea.new
    respond_with(@practice_area)
  end

  def edit
  end

  def create
    @practice_area = PracticeArea.new(practice_area_params)
    @practice_area.save
    respond_with(@practice_area)
  end

  def update
    @practice_area.update(practice_area_params)
    respond_with(@practice_area)
  end

  def destroy
    @practice_area.destroy
    respond_with(@practice_area)
  end

  private
    def set_practice_area
      @practice_area = PracticeArea.find(params[:id])
    end

    def practice_area_params
      params.require(:practice_area).permit(:name, :subject)
    end
end
