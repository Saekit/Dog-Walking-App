class CreateWalkers < ActiveRecord::Migration[5.2]
  def change
    create_table :walkers do |t|
      t.integer :age
      t.string :experience
      t.boolean :own_dogs, default: false
      t.integer :rating
      t.integer :user_id

      t.timestamps
    end
  end
end
