class CreatePractiseAreas < ActiveRecord::Migration
  def change
    create_table :practise_areas do |t|
      t.string :name
      t.string :subject

      t.timestamps
    end
  end
end
