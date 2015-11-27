class AddProvinceToQuestionAssociation < ActiveRecord::Migration
  def change
    add_reference :questions, :province, index: true
  end
end
