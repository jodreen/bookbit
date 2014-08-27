class FixDescriptionName < ActiveRecord::Migration
  def self.up
    rename_column :hexes, :description, :hexcode
  end

  def self.down
  end
end

