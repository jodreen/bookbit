class FixHexcodeName < ActiveRecord::Migration
  def self.up
    rename_column :hexes, :hex, :hexcode
  end

  def self.down
  end
end
