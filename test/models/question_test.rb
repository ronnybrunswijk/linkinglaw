# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#
# Indexes
#
#  index_questions_on_user_id  (user_id)
#

require 'test_helper'

class QuestionTest < Minitest::Test

  def setup 
    @question = Question.new
  end

  def test_type
    assert_instance_of Question, @question
  end

end
