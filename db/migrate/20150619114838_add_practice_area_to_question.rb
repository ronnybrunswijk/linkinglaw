class AddPracticeAreaToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :practice_area, index: true
  end
end
