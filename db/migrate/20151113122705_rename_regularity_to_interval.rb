class RenameRegularityToInterval < ActiveRecord::Migration
  def change
    rename_table :regularities, :intervals
  end
end
