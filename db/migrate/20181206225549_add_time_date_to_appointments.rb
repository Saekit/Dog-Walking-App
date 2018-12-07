class AddTimeDateToAppointments < ActiveRecord::Migration[5.2]
  def change
    remove_column :appointments, :start_time, :string
    remove_column :appointments, :date, :string
    remove_column :appointments, :end_time, :string

    add_column :appointments, :start_time, :datetime
    add_column :appointments, :end_time, :datetime
    add_column :appointments, :date, :datetime
  end
end
