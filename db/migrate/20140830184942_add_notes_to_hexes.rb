class AddNotesToHexes < ActiveRecord::Migration
  def change
    add_column :hexes, :notes, :string
  end
end
