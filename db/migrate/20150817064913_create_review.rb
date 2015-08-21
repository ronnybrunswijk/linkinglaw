class CreateReview < ActiveRecord::Migration
  def change
    create_table :reviews, id: false  do |t|
      t.belongs_to :user, index: true
      t.belongs_to :profile, index: true 
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
