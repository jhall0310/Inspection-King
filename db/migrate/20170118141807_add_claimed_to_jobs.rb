class AddClaimedToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :claimed, :boolean
  end
end
