class RenameQuestionIdToAnswerId < ActiveRecord::Migration
  def change
    rename_column :endorsements, :question_id, :answer_id
  end
end
