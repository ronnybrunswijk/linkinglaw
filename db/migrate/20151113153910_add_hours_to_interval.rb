class AddHoursToInterval < ActiveRecord::Migration
  def change
    add_column :intervals, :hours, :integer
  end
end
