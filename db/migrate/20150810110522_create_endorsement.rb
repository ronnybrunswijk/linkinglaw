class CreateEndorsement < ActiveRecord::Migration
  def change
    create_table :endorsements do |t|
      t.integer :profile_id
      t.integer :queston_id
      
      t.timestamps
    end
  end
end
