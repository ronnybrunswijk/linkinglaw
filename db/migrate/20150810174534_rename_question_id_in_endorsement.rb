class RenameQuestionIdInEndorsement < ActiveRecord::Migration
  def change
    rename_column :endorsements, :queston_id, :question_id
  end
end
