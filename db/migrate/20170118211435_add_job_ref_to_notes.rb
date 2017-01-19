class AddJobRefToNotes < ActiveRecord::Migration[5.0]
  def change
    add_reference :notes, :job, foreign_key: true
  end
end
