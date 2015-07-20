class AddProvinceToAddress < ActiveRecord::Migration
  def change
    add_reference :addresses, :province, index: true
  end
end
