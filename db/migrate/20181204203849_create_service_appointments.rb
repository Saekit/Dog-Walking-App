class CreateServiceAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :service_appointments do |t|
      t.integer :service_total
      t.integer :appointment_id
      t.integer :service_id

      t.timestamps
    end
  end
end
