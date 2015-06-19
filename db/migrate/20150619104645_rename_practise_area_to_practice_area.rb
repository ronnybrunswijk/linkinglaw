class RenamePractiseAreaToPracticeArea < ActiveRecord::Migration
  def change
    rename_table :practise_areas, :practice_areas
  end
end
