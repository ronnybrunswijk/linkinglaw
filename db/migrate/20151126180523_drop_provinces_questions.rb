class DropProvincesQuestions < ActiveRecord::Migration
  def change
    drop_table :provinces_questions    
  end
end
