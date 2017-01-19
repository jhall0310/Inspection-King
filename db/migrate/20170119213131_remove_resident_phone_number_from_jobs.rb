class RemoveResidentPhoneNumberFromJobs < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :resident_phone_number, :integer
  end
end
