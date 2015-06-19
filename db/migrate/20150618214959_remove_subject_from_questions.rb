class RemoveSubjectFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :subject, :string
  end
end
