class RemoveIdFromEndorsement < ActiveRecord::Migration
  def change
    remove_column :endorsements, :id, :integer
  end
end
