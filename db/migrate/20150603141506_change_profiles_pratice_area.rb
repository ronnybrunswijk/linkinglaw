class ChangeProfilesPraticeArea < ActiveRecord::Migration
  def change
    rename_column :profiles, :practise_area, :practice_area
  end
end
