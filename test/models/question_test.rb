require 'test_helper'

class QuestionTest < Minitest::Test

  def setup 
    @question = Question.new
  end

  def test_type
    assert_instance_of Question, @question
  end

end
