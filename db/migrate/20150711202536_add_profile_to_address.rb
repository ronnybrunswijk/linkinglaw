class AddProfileToAddress < ActiveRecord::Migration
  def change
    add_reference :addresses, :profile, index: true
  end
end
