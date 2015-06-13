class AddBusinessAddressAndCityAndPhoneToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :business_address, :string
    add_column :profiles, :city, :string
    add_column :profiles, :phone, :string
  end
end
