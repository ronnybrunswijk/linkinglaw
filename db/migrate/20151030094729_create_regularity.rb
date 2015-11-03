class CreateRegularity < ActiveRecord::Migration
  def change
    create_table :regularities do |t|
      t.string :name
    end
  end
end
