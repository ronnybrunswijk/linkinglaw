class RenameZipCodeAndHousenumberSuffix < ActiveRecord::Migration
  def change
    rename_column :addresses, :zipCode, :zip_code
    rename_column :addresses, :housenumberSuffix, :housenumber_suffix
  end
end
