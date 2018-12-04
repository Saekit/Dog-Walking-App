class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :breed
      t.string :size
      t.string :restriction, default: nil
      t.string :friendliness
      t.string :image_url, default: nil
      t.integer :owner_id

      t.timestamps
    end
  end
end
