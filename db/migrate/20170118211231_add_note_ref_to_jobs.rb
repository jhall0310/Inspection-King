class AddNoteRefToJobs < ActiveRecord::Migration[5.0]
  def change
    add_reference :jobs, :note, foreign_key: true
  end
end
