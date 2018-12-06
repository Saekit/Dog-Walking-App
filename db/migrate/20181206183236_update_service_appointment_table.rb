class UpdateServiceAppointmentTable < ActiveRecord::Migration[5.2]
  def change
    add_column :service_appointments, :walked, :string, default: 0
    add_column :service_appointments, :walk_rating, :integer
    add_column :service_appointments, :walker_notes, :string
    add_column :service_appointments, :owner_comments, :string 
  end
end
