class RenamePracticeAreasAndProfilesToPracticeAreasProfiles < ActiveRecord::Migration
  def change
    rename_table :practice_areas_and_profiles, :practice_areas_profiles
  end
end
