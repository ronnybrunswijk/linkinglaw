class RenameStartAndEndInZipCodeRange < ActiveRecord::Migration
  def change
    rename_column :zip_code_ranges, :start, :first
    rename_column :zip_code_ranges, :end, :last
  end
end
