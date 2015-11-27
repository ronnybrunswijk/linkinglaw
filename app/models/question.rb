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
  
    def self.select_by_regions(regions)
       region_ids = regions.map(&:id)
       self.where(province_id: region_ids) 
    end  

    def self.select_questions_asked_after(notification_setting)
       point_in_time = notification_setting.next_point_in_time.beginning_of_hour
       point_in_time -= notification_setting.interval.hours.hours
       Question.where('created_at >= ?', point_in_time)
    end
    
end
