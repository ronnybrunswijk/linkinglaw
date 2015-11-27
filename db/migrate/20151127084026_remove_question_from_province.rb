class RemoveQuestionFromProvince < ActiveRecord::Migration
  def change
    remove_reference :provinces, :question, index: true
  end
end
