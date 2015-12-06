# == Schema Information
#
# Table name: questions
#
#  id               :integer          not null, primary key
#  title            :string(255)
#  description      :text
#  created_at       :datetime
#  updated_at       :datetime
#  user_id          :integer
#  practice_area_id :integer
#  province_id      :integer
#
# Indexes
#
#  index_questions_on_practice_area_id  (practice_area_id)
#  index_questions_on_province_id       (province_id)
#  index_questions_on_user_id           (user_id)
#

class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :practice_area
  belongs_to :province
  has_many :answers, dependent: :destroy
  validates :title, length: { in: 1..100 }
  validates :description, length: { in: 1..500 }
  
    def select_lawyers_to_notify_immediately

      join_tables = [:interval, :provinces]
      query = "intervals.hours = 0 and provinces.id = :province_id"
      params = {}
      params[:province_id] = province_id # it's mandatory to set a region for a question, so it's always there

      if practice_area_id # it's optional to set a practice area for a question, so check if it's there
        query << " and practice_areas.id = :practice_area_id"
        join_tables << :practice_areas
        params[:practice_area_id] = practice_area_id
      end

      User.joins(notification_setting: join_tables).where(query, params)
      
    end
    
end
