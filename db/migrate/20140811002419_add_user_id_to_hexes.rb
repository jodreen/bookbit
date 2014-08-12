class AddUserIdToHexes < ActiveRecord::Migration
  def change
    add_column :hexes, :user_id, :integer
    add_index :hexes, :user_id
  end
end
