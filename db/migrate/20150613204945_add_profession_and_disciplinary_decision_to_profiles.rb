class AddProfessionAndDisciplinaryDecisionToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :profession, :string
    add_column :profiles, :disciplinary_decision, :boolean
  end
end
