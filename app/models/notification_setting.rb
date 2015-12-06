# == Schema Information
#
# Table name: notification_settings
#
#  id                 :integer          not null, primary key
#  created_at         :datetime
#  updated_at         :datetime
#  user_id            :integer
#  next_point_in_time :datetime
#  interval_id        :integer
#
# Indexes
#
#  index_notification_settings_on_interval_id  (interval_id)
#  index_notification_settings_on_user_id      (user_id)
#

class NotificationSetting < ActiveRecord::Base
  belongs_to :interval
  has_and_belongs_to_many :provinces  
  has_and_belongs_to_many :practice_areas    
  
  def self.select_lawyers_to_notify_periodically
      now = DateTime.current.beginning_of_hour
      User.joins(:notification_setting).where('notification_settings.next_point_in_time = ?', now)
  end

  def select_questions(include_interval)

     questions = []
     
     if practice_areas.empty? and provinces.empty? and not include_interval
       questions.push(*Question.limit(10))
     else 
       tables = []
       query = ""
       params = {}
       if not practice_areas.empty? 
          tables << :practice_area
          query = "practice_areas.id in (:practice_area_ids)"
          params[:practice_area_ids] = practice_areas.map(&:id)
       end

       if not provinces.empty? 
          tables << :province
          query += " and " if query.length > 0
          query += "provinces.id in (:province_ids)"
          params[:province_ids] = provinces.map(&:id)
       end
       
       if include_interval
          query += " and " if query.length > 0
          query += "questions.created_at >= :created_at"
          after = DateTime.current.beginning_of_hour - interval.hours.hours
          params[:created_at] = after          
       end

       questions = Question.joins(tables).where(query, params).limit(10)       
     end

     questions
  end

  def update_next_point_in_time
      new_next_point_in_time = next_point_in_time + interval.hours.hours
      update_attribute(:next_point_in_time, new_next_point_in_time)
  end
  
end
