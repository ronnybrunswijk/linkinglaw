class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search, :show]
  before_action :lawyer_only, only: [:update]
  before_action :set_profile, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @profiles = Profile.page(1)
    respond_with(@profiles)
  end

  # TODO url pattern even sa fan search/practice_area_id/:practice_area_id/province_id/:province_id as sa yts
  def search
    page_no = params[:page_no] || 1
    @profiles = Profile.retrieve(params).page(page_no)
    render partial: 'search' 
  end  

  def show
    @profile = Profile.find(params[:id])
    respond_with(@profile)
  end

  def new
    @profile = Profile.new
    respond_with(@profile)
  end

  def edit
    @s3 = S3_BUCKET.presigned_post(key: "uploads/avatars/#{SecureRandom.uuid}/${filename}", success_action_status: 201, acl: :public_read)
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
      params.require(:profile).permit(:first_name, :avatar_url, practice_area_ids: [])
    end
end
