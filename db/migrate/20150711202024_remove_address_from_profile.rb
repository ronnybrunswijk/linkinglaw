class RemoveAddressFromProfile < ActiveRecord::Migration
  def change
    remove_reference :profiles, :address, index: true
  end
end
