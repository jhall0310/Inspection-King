class ChangeUsersPhoneNumber < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      change_table :users do |t|
        dir.up   { t.change :phone_number, :integer }
        dir.down { t.change :phone_number, :bigint }
      end
    end
  end
end
