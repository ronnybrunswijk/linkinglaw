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
  validates :title, length: { in: 1..100 }
  validates :description, length: { in: 1..500 }
end
