class AddInspectionRefToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_reference :admins, :inspection, foreign_key: true
  end
end
