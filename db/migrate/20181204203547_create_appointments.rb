class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.integer :dog_id
      t.integer :walker_id
      t.datetime :datetime
      t.integer :status, default: 0
      t.boolean :walked, default: false
      t.integer :walk_rating
      t.string :comment

      t.timestamps
    end
  end
end
