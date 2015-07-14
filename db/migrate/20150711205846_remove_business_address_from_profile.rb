class RemoveBusinessAddressFromProfile < ActiveRecord::Migration
  def change
    remove_column :profiles, :business_address, :string
  end
end
