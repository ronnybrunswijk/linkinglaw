class RenameQuestionsProvincesToProvincesQuestions < ActiveRecord::Migration
  def change
    rename_table :questions_provinces, :provinces_questions
  end
end
