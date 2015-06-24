class CreatePracticeAreasAndProfiles < ActiveRecord::Migration
  def change
    create_table :practice_areas_and_profiles, id: false do |t|
      t.belongs_to :practice_area, index: true
      t.belongs_to :profile, index: true 
    end
  end
end
