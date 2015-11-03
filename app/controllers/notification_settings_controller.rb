class NotificationSettingsController < ApplicationController
  before_action :set_notification_setting, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :lawyer_only 

  respond_to :html

  def index
    @notification_settings = NotificationSetting.all
    respond_with(@notification_settings)
  end

  def show
    respond_with(@notification_setting)
  end

  def new
    @notification_setting = NotificationSetting.new
    respond_with(@notification_setting)
  end

  def edit
  end

  def create
    @notification_setting = NotificationSetting.new(notification_setting_params)
    flash[:notice] = 'NotificationSetting was successfully created.' if @notification_setting.save
    respond_with(@notification_setting)
  end

  def update
    flash[:notice] = 'NotificationSetting was successfully updated.' if @notification_setting.update(notification_setting_params)
    respond_with(@notification_setting)
  end

  def destroy
    @notification_setting.destroy
    respond_with(@notification_setting)
  end

  private
    def set_notification_setting
      @notification_setting = NotificationSetting.find(params[:id])
    end

    def notification_setting_params
      params.require(:notification_setting).permit(:regularity_id)
    end
end
