class AddProvinceToQuestions < ActiveRecord::Migration
  def change
    add_reference :provinces, :question, index: true
  end
end
