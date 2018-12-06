class UpdateWalkerTable < ActiveRecord::Migration[5.2]
  def change
    add_column :walkers, :name, :string
  end
end
