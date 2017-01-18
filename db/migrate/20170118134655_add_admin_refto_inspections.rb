class AddAdminReftoInspections < ActiveRecord::Migration[5.0]
  def change
    add_reference :inspections, :admin, foreign_key: true
  end
end
