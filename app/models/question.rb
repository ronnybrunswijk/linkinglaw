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
#
# Indexes
#
#  index_questions_on_practice_area_id  (practice_area_id)
#  index_questions_on_user_id           (user_id)
#

class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :practice_area
  has_many :answers, dependent: :destroy
  has_and_belongs_to_many :provinces
  validates :title, length: { in: 1..100 }
  validates :description, length: { in: 1..500 }
  
    def self.find_with(provinces)
       province_ids = provinces.map(&:id)
       self.joins(:provinces).where(provinces: {id:  province_ids}) 
    end  

    def self.find_without_provinces
       self.includes(:provinces).where(provinces: {id: nil}) 
    end  
    
    def self.find_with_and_without_provinces(provinces)
       questions = self.find_with(provinces)
       questions.push(*self.find_without_provinces)
    end
end
