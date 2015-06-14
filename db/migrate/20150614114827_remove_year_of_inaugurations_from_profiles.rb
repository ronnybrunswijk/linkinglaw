class RemoveYearOfInaugurationsFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :year_of_inauguration, :integer
  end
end
