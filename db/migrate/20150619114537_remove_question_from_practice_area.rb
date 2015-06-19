class RemoveQuestionFromPracticeArea < ActiveRecord::Migration
  def change
    remove_reference :practice_areas, :question, index: true
  end
end
