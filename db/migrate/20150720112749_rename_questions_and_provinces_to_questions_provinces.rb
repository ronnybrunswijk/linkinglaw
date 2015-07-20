class RenameQuestionsAndProvincesToQuestionsProvinces < ActiveRecord::Migration
  def change
    rename_table :questions_and_provinces, :questions_provinces  
  end
end
