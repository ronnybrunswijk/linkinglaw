class AddYearOfInaugurationAndYearsOfWorkExperienceToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :year_of_inauguration, :integer
    add_column :profiles, :years_of_work_experience, :integer
  end
end
