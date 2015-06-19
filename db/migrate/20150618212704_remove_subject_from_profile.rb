class RemoveSubjectFromProfile < ActiveRecord::Migration
  def change
    remove_column :profiles, :subject, :string
  end
end
