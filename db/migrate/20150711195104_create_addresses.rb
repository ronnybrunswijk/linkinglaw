class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :zipCode
      t.string :street
      t.string :housenumber
      t.string :housenumberSuffix
      t.string :city

      t.timestamps
    end
  end
end
