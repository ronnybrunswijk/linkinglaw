class ChangeBodyInReview < ActiveRecord::Migration
  def change
    change_column :reviews, :body, :text
  end
end
