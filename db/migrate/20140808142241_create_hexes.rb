class CreateHexes < ActiveRecord::Migration
  def change
    create_table :hexes do |t|
      t.string :description

      t.timestamps
    end
  end
end
