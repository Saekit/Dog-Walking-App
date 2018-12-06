class UpdateAppointmentTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :appointments, :walker_id, :integer
    remove_column :appointments, :datetime, :datetime
    remove_column :appointments, :walked, :boolean
    remove_column :appointments, :walk_rating, :integer
    remove_column :appointments, :comment, :string
    remove_column :appointments, :time, :string

    add_column :appointments, :start_time, :string
    add_column :appointments, :end_time, :string

  end
end
