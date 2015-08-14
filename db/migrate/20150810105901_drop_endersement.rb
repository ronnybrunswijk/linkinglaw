class DropEndersement < ActiveRecord::Migration
  def change
    drop_table :endorsements
  end
end
