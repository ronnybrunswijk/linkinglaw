class RemoveNameAndPracticeAreaFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :name, :string
    remove_column :profiles, :practice_area, :integer
  end
end
