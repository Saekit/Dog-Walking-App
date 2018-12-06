class AddWalkerIdToServiceAppointment < ActiveRecord::Migration[5.2]
  def change
    add_column :service_appointments, :walker_id, :integer
  end
end
