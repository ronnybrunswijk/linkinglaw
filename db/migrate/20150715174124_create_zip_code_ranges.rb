class CreateZipCodeRanges < ActiveRecord::Migration
  def change
    create_table :zip_code_ranges do |t|
      t.integer :start
      t.integer :end

      t.timestamps
    end
  end
end
