class AddResidentPhoneNumberToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :resident_phone_number, :string
  end
end
