class AddQuestionToPracticeArea < ActiveRecord::Migration
  def change
    add_reference :practice_areas, :question, index: true
  end
end
