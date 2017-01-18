class CreateInspections < ActiveRecord::Migration[5.0]
  def change
    create_table :inspections do |t|
      t.boolean :pending
      t.boolean :approved
      t.string :updates

      t.timestamps

      t.belongs_to :user
      t.belongs_to :job
    end
  end
end
