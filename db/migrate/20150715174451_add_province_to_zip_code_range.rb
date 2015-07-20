class AddProvinceToZipCodeRange < ActiveRecord::Migration
  def change
    add_reference :zip_code_ranges, :province, index: true
  end
end
