class NotificationSettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :lawyer_only 
  before_action :set_notification_setting, only: [:show, :edit, :update, :destroy]

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
    if @notification_setting.update(notification_setting_params)
      if @notification_setting.interval.hours == 24
        next_notification_time = @notification_setting.next_notification_time
        # if next notification time has already passed then set next day
        if next_notification_time <= DateTime.current
          next_notification_time += @notification_setting.interval.hours.hours
        end
        @notification_setting.next_notification_time = next_notification_time.beginning_of_hour
      else
        @notification_setting.next_notification_time = nil
      end
      flash[:notice] = 'NotificationSetting was successfully updated.' if @notification_setting.save
    end
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
      params.require(:notification_setting).permit(:next_notification_time, 
                                                   :interval_id, 
                                                   province_ids: [], 
                                                   practice_area_ids: [])
    end
end
