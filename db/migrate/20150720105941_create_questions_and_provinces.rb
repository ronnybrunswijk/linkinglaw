class CreateQuestionsAndProvinces < ActiveRecord::Migration
  def change
    create_table :questions_and_provinces, id: false do |t|
      t.belongs_to :question, index: true
      t.belongs_to :province, index: true 

    end
  end
end
