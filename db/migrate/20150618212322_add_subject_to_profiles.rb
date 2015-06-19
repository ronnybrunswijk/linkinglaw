class AddSubjectToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :subject, :string
  end
end
