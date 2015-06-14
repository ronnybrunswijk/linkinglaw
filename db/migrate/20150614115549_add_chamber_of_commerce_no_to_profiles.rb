class AddChamberOfCommerceNoToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :chamber_of_commerce_no, :string
  end
end
