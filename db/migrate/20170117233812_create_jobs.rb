class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :resident_type
      t.string :address
      t.string :inspection_type
      t.string :resident_name
      t.integer :resident_phone_number
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
