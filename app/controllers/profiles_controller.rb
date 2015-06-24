class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :lawyer_only, only: [:update, :show]
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @profiles = Profile.all
    respond_with(@profiles)
  end

  def show
    respond_with(@profile)
  end

  def new
    @profile = Profile.new
    respond_with(@profile)
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    flash[:notice] = 'Profile was successfully created.' if @profile.save
    respond_with(@profile)
  end

  def update
    flash[:notice] = 'Profile was successfully updated.' if @profile.update(profile_params)
    respond_with(@profile)
  end

  def destroy
    @profile.destroy
    respond_with(@profile)
  end

  private
    def set_profile
      @profile = current_user.profile
    end

    def profile_params
      params.require(:profile).permit(:name, practice_area_ids: [])
    end
end
