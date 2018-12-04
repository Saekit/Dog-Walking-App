class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :address
      t.string :city
      t.integer :user_id

      t.timestamps
    end
  end
end
