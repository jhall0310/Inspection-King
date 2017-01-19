class AddInspectionRefToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :inspection, foreign_key: true
  end
end
